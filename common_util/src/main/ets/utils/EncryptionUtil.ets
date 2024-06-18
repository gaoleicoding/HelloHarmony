import cryptoFramework from '@ohos.security.cryptoFramework';
import util from '@ohos.util';
import { CommonUtil } from './CommonUtil';

export class EncryptionUtil {
  /**
   * 密码加密
   * */
  static getPSWEncrypt(password: string): string {

    let KEY_INDEX_A = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    let KEY_INDEX_B = ["d", "e", "f", "g", "J", "p", "q", "r", "A", "B", "C", "F", "G", "H", "I", "s", "t", "u", "v", "w", "5", "D", "E", "6", "7", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "x", "y", "z", "0", "1", "2", "8", "9", "T", "U", "V", "W", "X", "Y", "Z", "a", "3", "4", "b", "c", "h", "i", "j", "k", "l", "m", "n", "o"];

    for (let index = 0; index < password.length; index++) {
      const character = password[index];

      for (let i = 0; i < KEY_INDEX_A.length; i++) {
        const key = KEY_INDEX_A[i];

        if (character == key) {
          password = password.substring(0, index) + KEY_INDEX_B[i] + password.substring(index + 1, password.length)
          break
        }
      }
    }
    const newPassword = EncryptionUtil.base64EncodeString(password)
    return newPassword
  }

  static async encryptMD5(text: string): Promise<string> {
    let cStr = "110"
    let md5 = cryptoFramework.createMd("MD5")
    let unit8Array: Uint8Array = CommonUtil.stringToUint8Array(text + cStr)
    await md5.update({
      data: unit8Array
    })
    let result = await md5.digest()
    console.info('EncryptionUtil', "result:" + result)
    let int8Array: Int8Array = CommonUtil.uint8ArrayToInt8Array(result.data)
    let encryptResult: string = ''
    for (let offset = 0; offset < int8Array.length; offset++) {
      let i = int8Array[offset];
      if (i < 0) {
        i += 256;
      }
      if (i < 16) {
        encryptResult += '0'
      }
      encryptResult += i.toString(16)
    }
    console.info('EncryptionUtil', "encryptResult:" + encryptResult)

    return encryptResult
  }

  static async md5Digest(text: string): Promise<string> {

    let md5 = cryptoFramework.createMd("MD5")
    let unit8Array: Uint8Array = CommonUtil.stringToUint8Array(text)
    await md5.update({
      data: unit8Array
    })

    let result = await md5.digest()
    console.info('EncryptionUtil', "result:" + result)
    return CommonUtil.uint8ArrayToString(result.data)

  }

  static base64EncodeString(content: string): string {
    return EncryptionUtil.base64Encode(CommonUtil.stringToUint8Array(content))
  }

  static base64Encode(array: Uint8Array): string {
    try {
      let arr = new util.Base64Helper().encodeSync(array)
      let str = CommonUtil.uint8ArrayToString(arr)
      return str
    } catch (err) {
      return ''
    }
  }

  static base64Decode(array: Uint8Array | string): string {
    try {
      let arr = new util.Base64Helper().decodeSync(array)
      let str = CommonUtil.uint8ArrayToString(arr)
      return str
    } catch (err) {
      return ''
    }
  }
}

