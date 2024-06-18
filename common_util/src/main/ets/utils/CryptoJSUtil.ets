import { CryptoJS } from '@ohos/crypto-js';

const KEY = 'fifedu@7f8g4er26'
const SECRETKEY = "fifedu)!@(*#$&^%"
const OFFSET = "5e8y7745ju8w9j99"
const IV_STRING = "A-16-BYTE:FIFEDU"
const CHARSET = "UTF-8"
const PATTERN_ECB = "ECB"
const PATTERN_CBC = "CBC"


export class CryptoJSUtil {
  static encryptAES(data: string): string {
    const key: string = CryptoJS.enc.Utf8.parse(KEY);
    const iv: string = CryptoJS.enc.Utf8.parse(OFFSET);
    const encrypted: string = CryptoJS.AES.encrypt(data, key, {
      iv: iv,
      mode: CryptoJS.mode.CBC,
      padding: CryptoJS.pad.Pkcs7
    });
    return encrypted.toString();
  }

  static decryptAES(encryptedData: string): string {
    let content = '7b2264617461223a223566616333343262613239633461383636363265346163306665646664646365222c2266726f6d223a2269706c6174222c226f70656e54797065223a2231227d'
    // 先将base64格式的字符串转成UTF-8的格式
    let result: string =CryptoJS.enc.Base64.parse(content).toString(CryptoJS.enc.Utf8);
    // 再将UTF-8格式的字符串转成文本
    return result
  }

  // static decryptAES(encryptedData: string): string {
  //   // const key: string = CryptoJS.enc.Utf8.parse(KEY);
  //   // const iv: string = CryptoJS.enc.Utf8.parse(OFFSET);
  //   // const decrypted: string = CryptoJS.AES.decrypt(encryptedData, key, {
  //   //   iv: iv,
  //   //   mode: CryptoJS.mode.CBC,
  //   //   padding: CryptoJS.pad.Pkcs7
  //   // });
  //   // // 使用 crypto-js 解码 Base64 字符串
  //   // const decodedString = CryptoJSUtil.getBase64Decrypt(decrypted.toString());
  //   //
  //   // // 将解码后的字节转换为字符串
  //   // const decodedString = bytes.toString(CryptoJS.enc.Utf8);
  //   let content='7b2264617461223a223566616333343262613239633461383636363265346163306665646664646365222c2266726f6d223a2269706c6174222c226f70656e54797065223a2231227d'
  //   // 先将base64格式的字符串转成UTF-8的格式
  //   let utf8String: undefined = CryptoJS.enc.Base64.parse(content);
  //   // 再将UTF-8格式的字符串转成文本
  //   let result: string = CryptoJS.enc.Utf8.stringify(utf8String);
  //
  //   return result
  // }

  /**
   * AES加密
   * */
  static setAESEncrypt(content: string): string {
    return CryptoJS.AES.encrypt(content, SECRETKEY)
  }

  /**
   * AES解密
   * */
  static getAESDecrypt(content: string): string {
    return CryptoJS.AES.decrypt(content, SECRETKEY)
  }

  /**
   * base64加密
   * */
  static setBase64Encrypt(content: string): string {
    // 首先将字符串转成UTF-8的形式
    let utf8String: undefined = CryptoJS.enc.Utf8.parse(content);

    // 然后将UTF-8形式的字符串编码成base64格式
    let base64String: string = CryptoJS.enc.Base64.stringify(utf8String);

    return base64String
  }

  /**
   * base64解码
   * */
  static getBase64Decrypt(content: string): string {
    // 先将base64格式的字符串转成UTF-8的格式
    let utf8String: undefined = CryptoJS.enc.Base64.parse(content);

    // 再将UTF-8格式的字符串转成文本
    let result: string = CryptoJS.enc.Utf8.stringify(utf8String);

    return result
  }

  /**
   * MD5加密
   * */
  static setMD5(content: string): string {
    return CryptoJS.MD5(content)
  }
}