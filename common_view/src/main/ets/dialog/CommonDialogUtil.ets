@CustomDialog
export struct CommonDialogUtil {
  cancel?: () => void
  confirm?: () => void
  controller: CustomDialogController
  title?: string | Resource
  message: string | Resource = ''

  build() {
    Column() {
      Column() {
        Text(this.title)
          .fontColor($r('app.color.color_black_85'))
          .fontSize($r('app.float.font_pixel_16'))
          .fontWeight(FontWeight.Bold)
          .margin({ top: $r('app.float.virtual_pixel_20'), bottom: $r('app.float.virtual_pixel_20') })
        if (!!this.message) {
          Text(this.message)
            .fontColor($r('app.color.color_black_60'))
            .fontSize($r('app.float.font_pixel_14'))
            .margin({ bottom: $r('app.float.virtual_pixel_20') })
        }
        Text().width('100%')
          .height($r('app.float.virtual_pixel_1'))
          .backgroundColor($r('app.color.color_gray_f8'))
          .padding({ left: $r('app.float.virtual_pixel_10'), right: $r('app.float.virtual_pixel_10') })
        Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
          Text($r('app.string.global_cancel'))
            .onClick(() => {
              this.controller.close()
              if (this.cancel) {
                this.cancel()
              }
            })
            .width('100%')
            .height('100%')
            .fontColor($r('app.color.color_black_85'))
            .fontSize($r('app.float.font_pixel_16'))
            .textAlign(TextAlign.Center)
          Text()
            .width($r('app.float.virtual_pixel_1'))
            .backgroundColor($r('app.color.color_gray_f8'))
            .height($r('app.float.virtual_pixel_16'))
          Text($r('app.string.global_confirm'))
            .onClick(() => {
              this.controller.close()
              if (this.confirm) {
                this.confirm()
              }
            })
            .width('100%')
            .height('100%')
            .fontColor($r('app.color.color_blue_3388FF'))
            .fontSize($r('app.float.font_pixel_16'))
            .textAlign(TextAlign.Center)
        }.height($r('app.float.virtual_pixel_50'))
      }.margin({ left: $r('app.float.virtual_pixel_50'), right: $r('app.float.virtual_pixel_50') })
      .backgroundColor($r('app.color.color_white'))
      .borderRadius($r('app.float.virtual_pixel_8'))
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}