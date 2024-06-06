import HybridEntity from './HybridEntity';
import { LiveEventBus } from '@ohos/liveeventbus';
import EventbusUtil from '../utils/EventbusUtil';
import JSONUtil from '../utils/JSONUtil';

export default class JSInterface {
  webCallNative(json: string) {
    console.info('JSInterface', 'json:' + json)
    let hybridEntity = JSONUtil.json2Bean(HybridEntity, json)
    let callNativeAction = hybridEntity?.appAction
    let callWebAction = hybridEntity?.webAction
    if ("modifyNavigationBarStyle" === callNativeAction) {
      let topBarData = hybridEntity?.getTopBarData()
      if (!!topBarData) {
        if (parseInt(topBarData.navigationBarType) == 2) {
          LiveEventBus
            .get(EventbusUtil.KEY_TEST_CLOSE_ALL_PAGE)
            .post('some_value');
        }
      }
    }
  }
}