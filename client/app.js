//app.js
var qcloud = require('./vendor/wafer2-client-sdk/index')
var config = require('./config')
App({
  onShow: function (e) {
    this.globalData.scene = e.scene
  },
  onLaunch: function () {
    qcloud.setLoginUrl(config.service.loginUrl)
    wx.getSetting({
      success: function (res) {
        wx.setStorageSync('logged', res.authSetting['scope.userInfo'] ? true : false)
      }
    })
  },
  globalData: {
    userInfo: null,
    scene:null
  }
})