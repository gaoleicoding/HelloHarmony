import router from '@ohos.router'

@Component
export default struct TitleView {
  @Prop title?: string | Resource
  @Prop isShowBackIcon?: boolean = true
  @Prop rightTitle?: string | Resource

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween }) {

      Row() {
        if (this.isShowBackIcon)
        Row() {
          Image($r("app.media.ic_back_black"))
            .width($r("app.float.virtual_pixel_12"))
            .height($r("app.float.virtual_pixel_24"))
        }.padding({
          left: $r('app.float.virtual_pixel_16'),
          top: $r('app.float.virtual_pixel_10'),
          right: $r('app.float.virtual_pixel_16'),
          bottom: $r('app.float.virtual_pixel_10')
        })
        .onClick(() => {
          router.back()
        })
      }.width('20%')
      .height($r('app.float.virtual_pixel_50'))
      .alignItems(VerticalAlign.Center)

      Text(this.title)
        .fontSize($r('app.float.font_pixel_18'))
        .fontColor($r('app.color.color_black_85'))
        .fontWeight(FontWeight.Bold)
        .width('40%')
        .height($r('app.float.virtual_pixel_50'))
        .textAlign(TextAlign.Center)

      Row() {
        Text(this.rightTitle)
          .fontColor($r('app.color.color_blue_main'))
          .textAlign(TextAlign.End)
          .width('100%')
          .fontSize($r('app.float.font_pixel_16'))
          .height($r('app.float.virtual_pixel_50'))
          .padding({ right: $r('app.float.virtual_pixel_12') })
          .align(Alignment.End)
      }.width('20%')
    }
    .width('100%')
    .height($r('app.float.virtual_pixel_50'))
  }
}