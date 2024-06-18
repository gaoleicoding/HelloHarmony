@CustomDialog
export struct TextPickerDialogUtil {
  controller: CustomDialogController
  onConfirm?: (index: number[]) => void
  rangeContent: TextCascadePickerRangeContent[] = []
  navigationBarHeight: number = 28
  index: number[] = []

  build() {
    Column() {
      Column() {
        TextPicker({ range: this.rangeContent })
          .canLoop(false)
          .onChange((value: string | string[], index: number | number[]) => {
            console.info('TextPicker 多列联动:onChange ' + JSON.stringify(value) + ', ' + 'index: ' + JSON.stringify(index))
            if (Array.isArray(index)) {
              this.index = index
            }
          })
        Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
          Text($r('app.string.global_cancel'))
            .onClick(() => {
              this.controller.close()

            })
            .width('100%')
            .height('100%')
            .fontColor($r('app.color.color_black_85'))
            .fontSize($r('app.float.font_pixel_16'))
            .textAlign(TextAlign.Center)
          Text()
            .width($r('app.float.virtual_pixel_1'))
            .backgroundColor($r('app.color.color_gray_f8'))
            .height($r('app.float.virtual_pixel_24'))
          Text($r('app.string.global_confirm'))
            .onClick(() => {
              this.controller.close()
              this.onConfirm?.(this.index)
            })
            .width('100%')
            .height('100%')
            .fontColor($r('app.color.color_blue_3388FF'))
            .fontSize($r('app.float.font_pixel_16'))
            .textAlign(TextAlign.Center)
        }.height($r('app.float.virtual_pixel_50'))
      }
      .padding({
        left: $r('app.float.virtual_pixel_20'),
        top: $r("app.float.virtual_pixel_20"),
        right: $r('app.float.virtual_pixel_20'),
      })
      .margin({
        left: $r('app.float.virtual_pixel_20'),
        right: $r('app.float.virtual_pixel_20'),
        bottom: $r('app.float.virtual_pixel_30')
      })
      .backgroundColor($r('app.color.color_white'))
      .borderRadius($r('app.float.virtual_pixel_8'))
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}