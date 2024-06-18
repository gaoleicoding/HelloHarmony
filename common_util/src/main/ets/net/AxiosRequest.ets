import { AxiosHttp } from './AxiosHttp';
import { AxiosError, AxiosHeaders, AxiosResponse } from '@ohos/axios';
// import { LoadingManager } from '@ohos/common_loading';
import { JsonUtil } from '../utils/JsonUtil';
import { LogUtil } from '../utils/LogUtil';
import { ToastUtil } from '../utils/ToastUtil';
import { CommonType } from '../common/TypeAlias';

export class AxiosRequest {
  /**
   * axios请求客户端创建
   */
  axiosHttp: AxiosHttp;

  constructor(mHeaders: AxiosHeaders, timeout: number) {
    if (!timeout) {
      timeout = 10 * 1000
    }
    this.axiosHttp = new AxiosHttp({
      timeout: timeout,
      checkResultCode: false,
      headers: mHeaders,
      interceptorHooks: {
        requestInterceptor: async (config) => {
          // 在发送请求之前做一些处理，例如打印请求信息
          LogUtil.debug('网络请求Request 请求方法:', `${config.method}`);
          LogUtil.debug('网络请求Request 请求链接:', `${config.url}`);
          LogUtil.debug('网络请求Request Params:', `\n${JsonUtil.stringify(config.params)}`);
          LogUtil.debug('网络请求Request headers:', `\n${JsonUtil.stringify(config.headers)}`);
          LogUtil.debug('网络请求Request Data:', `${JsonUtil.stringify(config.data)}`);
          // axiosClient.config.showLoading = config.showLoading
          // if (config.showLoading) {
          //   await LoadingManager.showLoadingWindow()
          // }
          return config;
        },
        requestInterceptorCatch: async (err) => {
          LogUtil.error("网络请求RequestError", err + '')
          // if (axiosClient.config.showLoading) {
          //   await LoadingManager.closeLoadingWindow()
          // }
          return err;
        },
        responseInterceptor: async (response: AxiosResponse) => {
          //优先执行自己的请求响应拦截器，在执行通用请求request的
          // if (axiosClient.config.showLoading) {
          //   await LoadingManager.closeLoadingWindow()
          // }
          LogUtil.debug('网络请求响应Response:', `\n${JsonUtil.stringify(response.data)}`);
          if (response.status === 200) {
            return Promise.resolve(response.data);
          } else {
            return Promise.reject(response);
          }
        },
        responseInterceptorCatch: async (error) => {
          // if (axiosClient.config.showLoading) {
          //   await LoadingManager.closeLoadingWindow()
          // }
          LogUtil.error("网络请求响应异常", error = "")
          errorHandler(error);
          return Promise.reject(error);
        },
      }
    });
  }
}

export function errorHandler(error: CommonType) {
  if (error instanceof AxiosError) {
    ToastUtil.showToast(error.message)
  }
}