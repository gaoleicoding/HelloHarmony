import myWebView from '@ohos.web.webview';
import TitleView from '../view/TitleView';
import TagUtil from '../utils/TagUtil';
import HomeAppObj from '../js/HomeAppObj';
import LogUtil from '../utils/LogUtil';

@Component
export default struct WebViewComponent {
  TAG: string = 'WebViewPage'
  isUseWebTile: boolean = false
  isShowTitleView: boolean = true
  myController: myWebView.WebviewController = new myWebView.WebviewController()
  @Prop weburl: string | Resource = ''
  title: string = ''
  objName: string = ''
  registerName: string = ''
  // 声明需要注册的对象
  @State registerObj?: object = new HomeAppObj()
  registerMethod?: Array<string>

  // 声明需要注册的对象
  build() {
    Column() {
      if (this.isShowTitleView) {
        TitleView({
          title: this.title
        }).width('100%')
          .height($r('app.float.virtual_pixel_50'))
      }
      Web({ src: this.weburl, controller: this.myController })
        .width('100%')
        .layoutWeight(1)
        .onTitleReceive((event) => {
          if (this.isUseWebTile) {
            // this.title=event?.title
          }
        })
        .domStorageAccess(true)//设置是否开启文档对象模型存储接口（DOM Storage API）权限，默认未开启。
        .fileAccess(true)//设置是否开启应用中文件系统的访问，默认启用。
        .imageAccess(true)//设置是否允许自动加载图片资源，默认允许。
        .javaScriptAccess(true)//设置是否允许执行JavaScript脚本，默认允许执行。
        .mixedMode(MixedMode.All)//设置是否允许HTTP和HTTPS混合内容，默认不允许加载HTTP和HTTPS混合内容。
        .onlineImageAccess(true)//设置是否允许从网络加载图片资源（通过HTTP和HTTPS访问的资源），默认允许访问。
        .databaseAccess(true)//设置是否开启数据库存储API权限，默认不开启。
        .geolocationAccess(true)//设置是否开启获取地理位置权限，默认开启。
        .multiWindowAccess(false)//设置是否开启多窗口权限，默认不开启。
        .cacheMode(CacheMode.Default)//设置缓存模式。
        .copyOptions(CopyOptions.CROSS_DEVICE)//设置剪贴板复制范围选项。
        .zoomAccess(false)//设置是否支持手势进行缩放，默认允许执行缩放。
        .databaseAccess(true)//设置是否开启数据库存储API权限，默认不开启。
        .allowWindowOpenMethod(true)
        .enableNativeEmbedMode(true)
          // 将对象注入到web端
        .javaScriptProxy({
          object: new HomeAppObj(),
          name: 'iplat',
          methodList: ["jump_more", 'jump_app', 'jump_apps', 'webCallNative'],
          controller: this.myController
        })
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.Blue)
  }

  aboutToAppear(): void {
    LogUtil.debug('WebViewPage', 'weburl：' + this.weburl)
    LogUtil.debug('WebViewPage', 'title：' + this.title)
    LogUtil.debug('WebViewPage', 'objName：' + this.objName)

    if (TagUtil.HOME_APP_JUMP === this.objName) {
      this.registerName = 'iplat'
      this.registerObj = new HomeAppObj()
      this.registerMethod = ["jump_more", 'jump_app', 'jump_apps', 'webCallNative']
    }
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}
