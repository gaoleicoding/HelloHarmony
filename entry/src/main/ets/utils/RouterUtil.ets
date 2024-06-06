import router from '@ohos.router'
import { RouterParams } from '../utils/RouterParams'
export default class RouterUtil {
  static goToWebView(weburl: string, title?: string | Resource) {
    router.pushUrl({
      url: 'pages/WebViewPage',
      params: {
        weburl: weburl,
        title: title,
      }
    }, router.RouterMode.Standard)
  }

  static goToWebViewWithParams(params: RouterParams) {
    router.pushUrl({
      url: 'pages/WebViewPage',
      params: params
    }, router.RouterMode.Standard)
  }

  static goToSepecificPage(url: string, params?: Object, routerMode = router.RouterMode.Standard) {
    router.pushUrl({
      url: url,
      params: params
    }, routerMode)
  }
}

