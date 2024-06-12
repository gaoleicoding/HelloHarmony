import showToast from './ToastUtil';

export class CommonUtil {
  static clickInterval: number = 2000;
  static lastClickTime: number = 0;

  static isFastClick(nowTime: number, interval?: number): boolean {
    if (!!interval) {
      CommonUtil.clickInterval = interval
    }
    let isFast: boolean = nowTime - CommonUtil.lastClickTime < CommonUtil.clickInterval
    if (isFast) {
      showToast($r("app.string.is_fast_click"))
    }
    CommonUtil.lastClickTime = nowTime
    return isFast;
  }

  static isMobileNumber(value: string): boolean {
    const mobileRegex = /^1[3-9]\d{9}$/;
    return mobileRegex.test(value);
  }

  //生成随机n位数字和字母混合的字符串
  static generateRandomUUID(n: number) {
    let chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
      'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    let res: string = "";
    for (let i = 0; i < n; i++) {
      let id = Math.floor(Math.random() * 36);
      res += chars[id];
    }
    return res;
  }
}