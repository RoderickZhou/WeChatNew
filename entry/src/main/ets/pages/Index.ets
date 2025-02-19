class TabBarClass {
  icon: ResourceStr = ""
  title: string = ""
  selectIcon: ResourceStr = ""
  name: string = ""
}

@Entry
@Component
struct Index {
  @State
  tabBarList: TabBarClass[] = [
    {
      icon: $r("app.media.ic_public_message"),
      name: "wechat",
      title: "微信",
      selectIcon: $r("app.media.ic_public_message_filled")
    },
    {
      icon: $r("app.media.ic_public_contacts_group"),
      name: "connect",
      title: "联系人",
      selectIcon: $r("app.media.ic_public_contacts_group_filled")
    }, {
    icon: $r("app.media.ic_gallery_discover"),
    name: "discover",
    title: "发现",
    selectIcon: $r("app.media.ic_gallery_discover_filled")
  }, {
    icon: $r("app.media.ic_public_contacts"),
    name: "my",
    title: "我的",
    selectIcon: $r("app.media.ic_public_contacts_filled")
  },

  ]
  @State
  currentIndex: number = 0

  @Builder
  CommonTabBar(item: TabBarClass) {
    Column() {
      Image(item.icon)
        .width(20)
        .height(20)
      Text(item.title)
        .fontSize(12)
        .margin({
          top: 5
        })
    }

  }

  build() {
    Column() {
      Tabs() {
        ForEach(this.tabBarList, (item: TabBarClass) => {
          TabContent().tabBar(this.CommonTabBar(item))
        }
        )
      }
      .barPosition(BarPosition.End)
    }
    .height('100%')
    .width('100%')
  }
}