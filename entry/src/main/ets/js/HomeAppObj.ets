import { LogUtil, ToastUtil } from 'common_util'


export default class HomeAppObj {
  webCallNative(json: string) {
    ToastUtil.showToast('webCallNative')
  }

  jump_more() {
    LogUtil.debug('HomeAppObj', 'jump_more----------------')
    ToastUtil.showToast('jump_more')
  }

  jump_app() {
    LogUtil.debug('HomeAppObj', 'jump_app----------------')
    ToastUtil.showToast('jump_app')
  }

  jump_apps() {
    LogUtil.debug('HomeAppObj', 'jump_apps----------------')
    ToastUtil.showToast('jump_apps')
  }
}