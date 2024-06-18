import { CommonType } from '../common/TypeAlias';
import { ClassConstructor, instanceToPlain, plainToClass } from 'class-transformer';

/*
* 在ArkTS中，想要将JSON 转为Class，最常见的方法就是 as Class，但是这种写法有一个很严重的问题，就是as 后的Class 中的function 方法丢失了，会报错提示找不到该方法。
* 使用框架：https://ohpm.openharmony.cn/#/cn/detail/class-transformer
*/
export class JsonUtil {
  /**
   * JSON字符串转Class对象
   * @param cls 类名
   * @param jsonStr json 字符串
   * @returns class对象
   */
  static json2Bean<T>(cls: ClassConstructor<T>, jsonStr: string): T | null {
    try {
      return plainToClass(cls, JSON.parse(jsonStr), {
        enableImplicitConversion: false, exposeDefaultValues: true
      }) as T
    } catch (e) {
      return null
    }
  }

  /**
   * 对象转字符串
   * @param data
   * @returns 字符串
   */
  static bean2Json(data: Object | Array<Object | String | Number | Boolean> | null | undefined): string {
    try {
      if (data == null || data == undefined) {
        return ''
      }
      return JSON.stringify(instanceToPlain(data))
    } catch (e) {
      return ""
    }
  }

  /**
   * JSON转Map
   * @param jsonStr
   * @returns
   */
  static json2Map(jsonStr: string): Map<string, Object> {
    return new Map(Object.entries(JSON.parse(jsonStr)));
  }

  static stringify(data: CommonType): string {
    return JSON.stringify(data);
  }

  static jsonToObject(jsonString: string): CommonType {
    return JSON.parse(jsonString);
  }

  static map2JsonObj(map: Map<string, string>): CommonType {
    let jsonObject: Record<string, string> = {};
    map.forEach((value, key) => {
      if (key != undefined && value != undefined) {
        jsonObject[key] = value;
      }
    })
    return JSON.parse(JSON.stringify(jsonObject));
  }

  static map2JsonStr(map: Map<string, string>): CommonType {
    let jsonObject: Record<string, string> = {};
    map.forEach((value, key) => {
      if (key != undefined && value != undefined) {
        jsonObject[key] = value;
      }
    })
    return JSON.stringify(jsonObject);
  }
}