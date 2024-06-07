import showToast from '../../../../../library/src/main/ets/utils/ToastUtil';
import EventbusUtil from '../utils/EventbusUtil';
import web_webview from '@ohos.web.webview';
import { Lifecycle, LiveEventBus, MState } from '@ohos/liveeventbus';
import WebViewComponent from '../component/WebViewComponent';
import TagUtil from '../utils/TagUtil';
import TitleView from '../view/TitleView';

@Entry
@Component
struct WebNaivePage {
  private mLifecycle: Lifecycle = new Lifecycle(MState.INITIALIZED);
  webviewController: web_webview.WebviewController = new web_webview.WebviewController();

  build() {
    Column() {
      TitleView({}).width('100%')
        .height($r('app.float.virtual_pixel_50'))
      WebViewComponent({
        isShowTitleView: false,
        weburl: $rawfile('index.html'),
        objName: TagUtil.HOME_APP_JUMP
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

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}
