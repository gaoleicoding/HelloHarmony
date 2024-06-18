@CustomDialog
export struct InputDialogUtil {
  controller: CustomDialogController
  @State text: string = ''
  textAreaType: number = 0
  title?: string | Resource
  onConfirm?: (text: string) => void

  build() {
    Column() {
      Column() {
        Text(this.title)
          .fontColor($r('app.color.color_black_85'))
          .fontSize($r('app.float.font_pixel_16'))
          .fontWeight(FontWeight.Bold)

        TextArea({
          placeholder: '请输入内容',
          text: this.text
        })
          .placeholderFont({ size: $r('app.float.font_pixel_16') })
          .placeholderColor($r("app.color.color_black_20"))
          .width('100%')
          .padding({
            left: $r('app.float.virtual_pixel_20'),
            top: $r("app.float.virtual_pixel_20"),
            right: $r('app.float.virtual_pixel_20'),
            bottom: $r("app.float.virtual_pixel_20")
          })
          .type(this.textAreaType)
          .maxLines(5)
          .maxLength(100)
          .fontSize($r('app.float.font_pixel_16'))
          .margin({ top: $r('app.float.virtual_pixel_20') })
          .fontColor($r("app.color.color_black_65"))
          .backgroundColor("#F5F6F7")
          .background()
          .onChange((value: string) => {
            this.text = value
          })
        Button('完成')
          .backgroundColor($r("app.color.color_blue_main"))
          .fontSize($r("app.float.font_pixel_17"))
          .fontColor(Color.White)
          .height($r("app.float.virtual_pixel_44"))
          .margin({ top: $r('app.float.virtual_pixel_20') })
          .borderRadius($r("app.float.virtual_pixel_4"))
          .margin({ top: $r("app.float.virtual_pixel_30") })
          .width('100%')
          .onClick(() => {
            this.onConfirm?.(this.text)
            this.controller.close()
          })
      }
      .padding({
        left: $r('app.float.virtual_pixel_20'),
        top: $r("app.float.virtual_pixel_20"),
        right: $r('app.float.virtual_pixel_20'),
        bottom: $r("app.float.virtual_pixel_20")
      })
      .margin({ left: $r('app.float.virtual_pixel_40'), right: $r('app.float.virtual_pixel_40') })
      .backgroundColor($r('app.color.color_white'))
      .borderRadius($r('app.float.virtual_pixel_8'))
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}