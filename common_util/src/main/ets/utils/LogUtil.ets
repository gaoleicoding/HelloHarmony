export class LogUtil {

  public static isLogOn: boolean = false;

  static debug(TAG: string, msg: string): void {
    console.debug(TAG, msg)
  }

  static info(TAG: string, msg: string): void {
    console.info(TAG, msg)
  }

  static warn(TAG: string, msg: string): void {
    console.warn(TAG, msg)
  }

  static error(TAG: string, msg: string): void {
    console.error(TAG, msg)
  }
}

