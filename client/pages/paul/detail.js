// pages/paul/detail.js
var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    matchInfo: null,
    paulStat: {},
    paulTop: new Array(10),
    scene: null,
    logged: wx.getStorageSync('logged'),
    multiArray: [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], [':'], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]]
  },

  onShow: function () {
    this.setData({
      scene: app.globalData.scene
    })
    var that = this
    wx.getSetting({
      success: function (res) {
        wx.setStorageSync('logged', res.authSetting['scope.userInfo'] ? true : false)
        if (wx.getStorageSync('logged') != that.data.logged) {
          that.setData({
            logged: wx.getStorageSync('logged')
          },
            function () {
              wx.showLoading({
                title: '加载中',
                mask: true
              })
              that.getMatchInfo(that.data.matchInfo.match_id)
            })
        }
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this
    that.setData({
      logged: wx.getStorageSync('logged')
    })
    //获取比赛信息
    this.getMatchInfo(options.matchId)
    //获取胜负平统计
    wx.request({
      url: config.service.paulUrl + '/stat',
      data: {
        matchId: options.matchId
      },
      success: function (res) {
        var paulStat = that.convertStat(res.data.data[0])
        // console.log(paulStat)
        that.setData({
          paulStat: paulStat
        })
      },
      fail: function (error) {
        wx.showToast({
          title: '获取失败'
        })
        // util.showModel('获取失败', error)
        console.log('request fail', error)
      },
      complete: function () {
      }
    })
    //获取预测TOP10
    wx.request({
      url: config.service.paulUrl + '/top',
      data: {
        matchId: options.matchId
      },
      success: function (res) {

        if (res.data.data.length) {
          var max = res.data.data[0].paul_ct
          res.data.data.map(function (item) {
            item.paul_ct = item.paul_ct / max
          })
        }
        that.setData({
          paulTop: res.data.data
        })
      },
      fail: function (error) {
        wx.showToast({
          title: '获取失败'
        })
        // util.showModel('获取失败', error)
        console.log('request fail', error)
      },
      complete: function () {
      }
    })
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  // onPullDownRefresh: function () {
  //   var options = {
  //     matchId: this.data.matchInfo.match_id
  //   }
  //   this.onLoad(options)
  //   wx.stopPullDownRefresh()
  // },


  onRefresh: function () {
    var options = {
      matchId: this.data.matchInfo.match_id
    }
    wx.showLoading({
      title: '加载中',
      mask: true
    })
    this.onLoad(options)
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function (res) {
    return {
      title: '掐指一算，这场比赛你怎么看？',
      path: '/pages/paul/detail?matchId=' + this.data.matchInfo.match_id
    }
  },

  backToHome: function () {
    wx.switchTab({
      url: '/pages/paul/index'
    })
  },

  convertStat: function (paulStat) {
    var temp = parseInt(paulStat.home_win) >= parseInt(paulStat.draw) ? paulStat.home_win : paulStat.draw
    var max = parseInt(temp) >= parseInt(paulStat.away_win) ? parseInt(temp) : parseInt(paulStat.away_win)
    paulStat.home_win = parseInt(paulStat.home_win) / max
    paulStat.draw = parseInt(paulStat.draw) / max
    paulStat.away_win = parseInt(paulStat.away_win) / max
    paulStat.total = parseInt(paulStat.total) / max
    return paulStat
  },

  bindMultiPickerChange: function (e) {
    var that = this
    //提交预测
    if (Date.parse(e.target.dataset.match.match_time) > Date.now()) {
      qcloud.request({
        url: config.service.paulUrl + '/put',
        method: 'POST',
        login: true,
        data: {
          paul_id: e.target.dataset.match.paul_id ? e.target.dataset.match.paul_id : -1,
          match_id: e.target.dataset.match.match_id,
          match_time: e.target.dataset.match.match_time,
          paul_home: that.data.multiArray[0][e.detail.value[0]],
          paul_away: that.data.multiArray[2][e.detail.value[2]]
        },
        success: function (res) {
          if (res.data.code == 0) {
            var options = {
              matchId: that.data.matchInfo.match_id
            }
            that.onLoad(options)
          }
        },
        fail: function (error) {
          wx.showToast({
            title: '提交失败'
          })
          // util.showModel('提交失败', error)
          console.log('request fail', error)
        }
      })
    }
    else {
      wx.showModal({
        title: '提示',
        content: '比赛已过期，无法预测',
        showCancel: false,
        success: function (res) {
          if (res.confirm) {
            that.onRefresh()
          }
          else {
          }
        }
      })
    }
  },

  login: function (e) {
    var that = this
    if (e.detail.userInfo) {
      // 调用登录接口
      if (!wx.getStorageSync('logged')) {
        //没有登录过
        wx.showLoading({
          title: '加载中',
          mask: true
        })
        qcloud.login({
          success: function () {
            wx.setStorageSync('logged', true)
            // app.globalData.logged = true
            that.setData({
              logged: true
            },
              function () {
                that.getMatchInfo(that.data.matchInfo.match_id)
              })
          },
          fail: function (error) {
            wx.showToast({
              title: '授权失败'
            })
            // util.showModel('授权失败', error)
            console.log('login fail', error)
          }
        })
      }
    } else {
      // this.setData({
      //   logged: false
      // })
    }
  },
  getMatchInfo: function (matchId) {
    var that = this
    var options = {
      login: true,
      data: {
        matchId: matchId
      },
      success: function (res) {
        // console.log(res)
        wx.setNavigationBarTitle({
          title: res.data.data.name
        })
        that.setData({
          matchInfo: res.data.data
        })
      },
      fail: function (error) {
        wx.showToast({
          title: '获取失败'
        })
        // util.showModel('获取失败', error)
        console.log('request fail', error)
      },
      complete: function () {
        wx.hideLoading()
      }
    }

    if (wx.getStorageSync('logged')) {  // 使用 qcloud.request 带登录态登录
      options.url = config.service.matchInfoWithPaulUrl
      qcloud.request(options)
    }
    else {    // 使用 wx.request 则不带登录态
      options.url = config.service.matchUrl + '/matchInfo'
      wx.request(options)
    }
  }
})