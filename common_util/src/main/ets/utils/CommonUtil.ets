import { ToastUtil } from './ToastUtil';
import util from '@ohos.util';

export class CommonUtil {
  static clickInterval: number = 2000;
  static lastClickTime: number = 0;

  static isFastClick(nowTime: number, interval?: number): boolean {
    if (!!interval) {
      CommonUtil.clickInterval = interval
    }
    let isFast: boolean = nowTime - CommonUtil.lastClickTime < CommonUtil.clickInterval
    if (isFast) {
      ToastUtil.showToast($r('app.string.is_fast_click'))
    }
    CommonUtil.lastClickTime = nowTime
    return isFast;
  }

  static isMobileNumber(value: string): boolean {
    const mobileRegex = /^1[3-9]\d{9}$/;
    return mobileRegex.test(value);
  }

  //生成随机n位数字和字母混合的字符串
  static generateRandomUUID() {
    util.generateRandomUUID(true)
  }

  static stringToUint8Array(str: string): Uint8Array {
    try {
      let textEncoder = new util.TextEncoder();
      let array: Uint8Array = textEncoder.encodeInto(str);
      return array
    } catch (err) {
      return new Uint8Array()
    }
  }

  static stringToInt8Array(str: string): Int8Array {
    const encoder = new util.TextEncoder(); // 默认使用UTF-8编码
    const uint8array = encoder.encodeInto(str);
    return CommonUtil.uint8ArrayToInt8Array(uint8array);
  }

  static uint8ArrayToString(arr: Uint8Array): string {
    let str = ''
    if (arr && arr.length > 0) {
      try {
        let textDecode = util.TextDecoder.create('utf-8')
        str = textDecode.decodeWithStream(arr)
      } catch (err) {
      }
    }
    return str
  }

  static int8ArrayToString(arr: Int8Array): string {
    let str = ''
    if (arr && arr.length > 0) {
      try {
        let textDecode = util.TextDecoder.create('utf-8')
        str = textDecode.decodeWithStream(CommonUtil.int8ArrayToUint8Array(arr))
      } catch (err) {
      }
    }
    return str
  }

  // 把没有符号的字节数组转化为有符号的字节数组
  static uint8ArrayToInt8Array(uint8Array: Uint8Array): Int8Array {
    // 使用位或操作符确保值是整数
    return new Int8Array(uint8Array.map(value => value | 0));
  }

  static int8ArrayToUint8Array(int8Array: Int8Array): Uint8Array {
    const uint8Array = new Uint8Array(int8Array.length);
    for (let i = 0; i < int8Array.length; i++) {
      uint8Array[i] = int8Array[i] < 0 ? int8Array[i] + 256 : int8Array[i];
    }
    return uint8Array;
  }

  static getTextDecode(encoding: string, content: string): string {
    let textDecoderOptions: util.TextDecoderOptions = {
      fatal: false,
      ignoreBOM: true
    }
    let decodeWithStreamOptions: util.DecodeWithStreamOptions = {
      stream: false
    }
    // 创建解码器
    let textDecoder = util.TextDecoder.create(encoding, textDecoderOptions)
    // 解码
    return textDecoder.decodeWithStream(CommonUtil.stringToUint8Array(content), decodeWithStreamOptions);
  }

  static getUrlParamsToMap(url: string): Map<string, string> {
    const paramsMap = new Map<string, string>();
    let strs: string[] = url.split("?")
    if (strs.length > 1) {
      let params: string[] = url.split("&")
      params.forEach((value, index) => {
        let values: string[] = value.split("=")
        paramsMap.set(values[0], values[1]);
      });
    }
    return paramsMap;
  }
}