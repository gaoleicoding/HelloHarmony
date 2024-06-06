import CommonUtil from '../../../../../library/src/main/ets/components/CommonUtil';
import JSInterface from '../bean/JSInterface';
import EventbusUtil from '../utils/EventbusUtil';
import showToast from '../utils/ToastUtil';
import web_webview from '@ohos.web.webview';
import { Lifecycle, LiveEventBus, MState } from '@ohos/liveeventbus';

@Entry
@Component
struct Index {
  private mLifecycle: Lifecycle = new Lifecycle(MState.INITIALIZED);
  @State message: string = 'Hello World';
  webviewController: web_webview.WebviewController = new web_webview.WebviewController();
  // 声明需要注册的对象
  @State testObj: JSInterface = new JSInterface();

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .width('100%')
        .height('50')
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          CommonUtil.isFastClick(new Date().getTime())
        })
        .height('50')
      Web({ src: $rawfile('index.html'), controller: this.webviewController })// 将对象注入到web端
        .javaScriptProxy({
          object: this.testObj,
          name: "androidInjected",
          methodList: ["webCallNative"],
          controller: this.webviewController
        })
    }
    .width('100%')
    .height('100%')
  }

  aboutToAppear() {
    //创建生命周期感知对象
    this.mLifecycle = new Lifecycle(MState.STARTED)
    //订阅消息
    LiveEventBus
      .get<string>(EventbusUtil.KEY_TEST_CLOSE_ALL_PAGE)
      .observe(this, {
        onChanged(s) {
          showToast(s)
        }
      });
  }

  aboutToDisappear() {
    this.mLifecycle.markState(MState.DESTROYED)
  }

  //生命周期感知对象
  getLifecycle(): Lifecycle {
    return this.mLifecycle
  }
}
