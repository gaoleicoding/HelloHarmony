import RouterUtil from '../utils/RouterUtil';
import TitleView from '../view/TitleView';

@Entry
@Component
export struct SettingPage {
  aar: string[] = ['前端和应用交互', 'WebView', '回调']

  build() {
    Column() {
      TitleView({
        title: $r("app.string.app_name"),
        isShowBackIcon: false
      })
      //列表
      List() {
        ForEach(this.aar, (item: string, index: number) => {
          ListItem() {
            Row() {
              Text(item)
                .layoutWeight(1)
                .fontSize($r('app.float.font_pixel_16'))
                .margin({ left: $r('app.float.virtual_pixel_20') })
                .fontColor($r('app.color.color_black_85'))
                .textAlign(TextAlign.Start)

              Image($r("app.media.ic_arrow_right"))
                .width($r('app.float.virtual_pixel_8'))
                .height($r('app.float.virtual_pixel_14'))
                .margin({ right: $r('app.float.virtual_pixel_20') })

            }.height($r('app.float.virtual_pixel_54'))
            .alignItems(VerticalAlign.Center)
          }.onClick(() => {
            if (index === 0) {
              RouterUtil.goToSepecificPage('pages/WebNativePage')
            } else if (index === 1) {
              RouterUtil.goToWebView('www.baidu.com')
            } else if (index === 2) {
            }
          })
          .stateStyles({
            focused: { //获得活动焦点时
              .backgroundColor($r('app.color.color_gray_e5'))
            },
            pressed: { //点击按下时
              .backgroundColor($r('app.color.color_gray_e5'))
            },
            normal: { //正常状态下
              .backgroundColor($r('app.color.color_white'))
            }
          })
        }, (item: string) => JSON.stringify(item))
      }
      .width('100%')
      .listDirection(Axis.Vertical) // 排列方向
      .divider({ strokeWidth: 1, color: $r('app.color.color_gray_f8') })
      .scrollBar(BarState.Off)
    }
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}