import { DafaultUserList, UserInfo } from '../models/users'
import { router } from '@kit.ArkUI'

@Component
struct Connect {
  @State
  filterList: UserInfo[] = []
  @State
  @Watch("filterName")
  searchName: string = ""

  aboutToAppear(): void {
    this.filterList = DafaultUserList
  }

  filterName() {
    this.filterList = DafaultUserList.filter((user: UserInfo) => {
      return user.username.includes(this.searchName)
    })
  }

  build() {
    Column() {
      //搜索栏
      Row() {
        Search({ placeholder: "搜索", value: $$this.searchName })
          .backgroundColor($r("app.color.white"))
          .borderRadius(4)
          .height(40)
          .onSubmit((value: string) => {
            AlertDialog.show({
              message: this.searchName
            })
            this.searchName = value
          })
      }
      //.width("100")
      .padding({
        left: 10,
        right: 10
      })

      //联系人列表
      List() {
        ForEach(this.filterList, (item: UserInfo) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.avatar)
                .width(30)
                .height(30)
                .borderRadius(4)
              Column() {
                Text(item.username)
                  .fontSize(14)
                  .fontColor($r("app.color.text_primary"))
              }
              .layoutWeight(1)
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Center)
            }
            .padding({
              left: 10,
              right: 10
            })
            .height(60)
            .width("100%")
            .stateStyles({
              pressed: {
                .backgroundColor($r("app.color.back_color"))
              },
              normal: {
                .backgroundColor($r("app.color.white"))
              }

            })

          }
          .onClick(() => {
            router.pushUrl({
              url: "pages/ChatDetail/ChatDetail",
              params: item
            })
          })
        }, (item: UserInfo) => item.user_id) //用ID确保唯一性
      }
      .divider({
        strokeWidth: 1,
        color: $r("app.color.border_color")
      })
      .padding({
        top: 10,
        bottom: 10
      })
      .width("100%")
      .height("100%")
      .layoutWeight(1)
      .backgroundColor($r("app.color.white"))
    }
    .width("100%")
    .height("100%")
    .backgroundColor($r("app.color.back_color"))
    .padding({
      top: 10
    })
  }
}

export default Connect

function aboutToAppear(): UserInfo[] {
  throw new Error("Function not implemented.")
}
