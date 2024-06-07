import LogUtil from '../utils/LogUtil';
import showToast from '../../../../../library/src/main/ets/utils/ToastUtil';


export default class HomeAppObj {
  webCallNative(json: string) {
    showToast('webCallNative')
  }

  jump_more() {
    LogUtil.debug('HomeAppObj', 'jump_more----------------')
    showToast('jump_more')
  }

  jump_app() {
    LogUtil.debug('HomeAppObj', 'jump_app----------------')
    showToast('jump_app')
  }

  jump_apps() {
    LogUtil.debug('HomeAppObj', 'jump_apps----------------')
    showToast('jump_apps')
  }

}