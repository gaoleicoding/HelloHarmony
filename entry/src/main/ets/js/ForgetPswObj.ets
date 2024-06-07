import router from '@ohos.router';
import LogUtil from '../utils/LogUtil';


export default class ForgetPswObj {
  constructor() {
  }

  jump_more() {
    LogUtil.debug('ForgetPswObj', 'jump_more----------------')
    router.back()
  }

  whetherCode() {
    LogUtil.debug('ForgetPswObj', 'whetherCode----------------')
  }
}