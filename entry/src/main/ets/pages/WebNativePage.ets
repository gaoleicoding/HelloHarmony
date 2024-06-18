import { ToastUtil } from 'common_util';
import EventbusUtil from '../utils/EventbusUtil';
import { Lifecycle, LiveEventBus, MState } from '@ohos/liveeventbus';
import WebViewComponent from '../component/WebViewComponent';
import TagUtil from '../utils/TagUtil';
import TitleView from '../view/TitleView';

@Entry
@Component
struct WebNaivePage {
  private mLifecycle: Lifecycle = new Lifecycle(MState.INITIALIZED);
  // webviewController: web_webview.WebviewController = new web_webview.WebviewController();
  home_app_jump_url: string = 'https://www.fifedu.com/iplat/fifMobile/app_manage/index_h5.html?p=eyJ1c2VySWQiOiIwYTBlNzhhZjFjZTU0YTkxOTM2Mjk4MjdmN2NlYzQwMyIsInNjaG9vbElkIjoiMjAwMDAwMDAyNjAwMDAwMDAwMSIsImxvZ2luTmFtZSI6ImNzQkZTVTE5OTEiLCJzZXNzaW9uSWQiOiJleUowZVhBaU9pSktWMVFpTENKaGJHY2lPaUpJVXpJMU5pSjkuZXlKeVpXRnNUbUZ0WlNJNkl1V29uLVdUcFNJc0luTmphRzl2YkVsa0lqb2lNakF3TURBd01EQXlOakF3TURBd01EQXdNU0lzSW1semN5STZJbVpwWm1Gaklpd2lhV1FpT2lJeU9ERXhNREF3TURJMk1EQXhOell4T0RZNUlpd2laWGh3SWpveE56RTRNalEwT1RnM0xDSnRaVzFpWlhKSlpDSTZJakJoTUdVM09HRm1NV05sTlRSaE9URTVNell5T1RneU4yWTNZMlZqTkRBekluMC5velJuRENCRjVpVlpxa0V2UEp0NDBmYTFWeWZmb08xd191ckdreGxtNFlJIiwicm9sZU5hbWUiOiJ0ZWFjaGVyIiwiaXNQcml2YXRlIjoiMCJ9&m=aaa50689f8be041364e0a9e42bc47675'

  build() {
    Column() {
      TitleView({}).width('100%')
        .height($r('app.float.virtual_pixel_50'))
      WebViewComponent({
        isShowTitleView: false,
        weburl: this.home_app_jump_url,
        // weburl: $rawfile('index.html'),
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
          ToastUtil.showToast(s)
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
