import promptAction from '@ohos.promptAction';

export class ToastUtil {
  static showToast(message: string | Resource, duration: number = 2000) {
    try {
      promptAction.showToast({
        message: message,
        duration: duration,
        bottom: "center",
      })
    } catch (error) {
      console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
    }
  }
}