import preferences from '@ohos.data.preferences';
import { CryptoJSUtil } from './CryptoJSUtil';

/**
 * 项目全局存储，使用ohos.data.preferences
 */
const defaultPreferenceName = "iplat_preferences"

type ValueType = number | string | boolean | Array<number> | Array<string> | Array<boolean> | Uint8Array;

export class PreferenceUtil {
  static preferenceInstance: preferences.Preferences

  // 初始化Preferences对象
  static createPreferences() {
    try {
      let options: preferences.Options = { name: defaultPreferenceName };
      PreferenceUtil.preferenceInstance = preferences.getPreferencesSync(getContext(), options)
    } catch (err) {
      console.error(`err:${err}`)
    }
  }

  static putSyncEncrypt(key: string, value: string) {
    try {
      if (!PreferenceUtil.preferenceInstance) {
        PreferenceUtil.createPreferences()
      }
      // 将数据保存到首选项，内存中
      PreferenceUtil.preferenceInstance.putSync(key, CryptoJSUtil.setAESEncrypt(value))
    } catch (err) {
      console.error('TAG', `Failed to put value, cause: ${err}}`)
    }
    // 持久化数据存储
    PreferenceUtil.preferenceInstance.flush()
  }

  static getSyncDecrypt(key: string, defaultValue: string): string {
    if (!PreferenceUtil.preferenceInstance) {
      PreferenceUtil.createPreferences()
    }
    let value: string = PreferenceUtil.preferenceInstance.getSync(key, defaultValue).toString()
    if (!value) {
      return ''
    }
    return CryptoJSUtil.getAESDecrypt(value)
  }

  static putSync(key: string, value: ValueType) {
    try {
      if (!PreferenceUtil.preferenceInstance) {
        PreferenceUtil.createPreferences()
      }
      // 将数据保存到首选项，内存中
      PreferenceUtil.preferenceInstance.putSync(key, value)
    } catch (err) {
      console.error('TAG', `Failed to put value, cause: ${err}}`)
    }
    // 持久化数据存储
    PreferenceUtil.preferenceInstance.flush()
  }

  static getSync(key: string, defaultValue: ValueType): ValueType {
    if (!PreferenceUtil.preferenceInstance) {
      PreferenceUtil.createPreferences()
    }
    return PreferenceUtil.preferenceInstance.getSync(key, defaultValue)
  }

  /**
   * 删除值
   */
  static async delete(key: string) {
    return await PreferenceUtil.preferenceInstance.delete(key)
  }

  /**
   * 清空
   */
  static async clear() {
    return await PreferenceUtil.preferenceInstance.clear()
  }
}