import { SelectItem } from '../bean/SelectItem'
import { ArrayList } from '@kit.ArkTS'

@CustomDialog
export struct SelectDialogUtil {
  controller: CustomDialogController
  selectItems: ArrayList<SelectItem> = new ArrayList()
  @State selectIndex: number = 0
  onConfirm?: (text: string) => void

  build() {
    Column() {
      Column() {
        //列表
        List() {
          ForEach(this.selectItems.convertToArray(), (item: SelectItem, index: number) => {
            ListItem() {
              Row() {
                Text(item.title)
                  .fontSize($r('app.float.font_pixel_16'))
                  .fontColor($r("app.color.color_black_85"))
                  .layoutWeight(1)
                  .margin({ left: $r('app.float.virtual_pixel_20') })
                  .textAlign(TextAlign.Start)
                  .borderRadius($r('app.float.virtual_pixel_8'))
                if (this.selectIndex == index) {
                  Image($r('app.media.icon_select_right'))
                    .width($r('app.float.virtual_pixel_18'))
                    .height($r('app.float.virtual_pixel_18'))
                    .margin({ right: $r('app.float.virtual_pixel_20') })
                }
              }.height($r('app.float.virtual_pixel_60'))
              .alignItems(VerticalAlign.Center)
            }.onClick(() => {
              this.selectIndex = index
              this.onConfirm?.(getContext().resourceManager.getStringSync(item.title))
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
          },
            (item: SelectItem) => JSON.stringify(item))
        }.width('100%')
        .listDirection(Axis.Vertical) // 排列方向
        .divider({ strokeWidth: 1, color: $r('app.color.color_gray_f8') })
        .scrollBar(BarState.Off)
      }.margin({ left: $r('app.float.virtual_pixel_54'), right: $r('app.float.virtual_pixel_54') })
      .backgroundColor($r('app.color.color_white'))
      .borderRadius($r('app.float.virtual_pixel_8'))
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}