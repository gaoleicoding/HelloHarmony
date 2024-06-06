import TopBarData from './TopBarData'

export default class HybridEntity {
  appAction: string = ''
  webAction: string = ''
  data = null

   getTopBarData(): TopBarData {
    let jsonData = JSON.stringify(this.data)
    return JSON.parse(jsonData) as TopBarData
  }
}
