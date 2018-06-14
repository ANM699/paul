// pages/paul/index.js
var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')
var app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    cosUrl: config.cosUrl,
    winHeight: 0,//窗口高度
    currentTab: 0, //预设当前项的值
    scrollLeft: 0, //tab标题的滚动条位置
    curCompetitionId: 0,
    matchList: {},
    competitionList: [],
    logged: wx.getStorageSync('logged'),
    sw: 1,
    multiArray: [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], [':'], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]]
  },

  onShow: function () {
    var that = this
    wx.getSetting({
      success: function (res) {
        wx.setStorageSync('logged', res.authSetting['scope.userInfo'] ? true : false)
        if (wx.getStorageSync('logged') != that.data.logged) {
          that.setData({
            logged: wx.getStorageSync('logged')
          },
            function () {
              // wx.showLoading({
              //   title: '加载中',
              //   mask: true
              // })
              that.data.matchList = {}
              that.getMatchs(that.data.curCompetitionId, '', function (res) {
                that.data.matchList[that.data.curCompetitionId] = res.data.data
                that.setData({
                  matchList: that.data.matchList
                })
              })
            })
        }
      }
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function () {
    var that = this
    that.setData({
      logged: wx.getStorageSync('logged')
    })
    wx.request({
      url: config.service.switchUrl,
      success: function (res) {
        that.setData({
          sw: res.data.data
        }, function () {
          //  高度自适应
          wx.getSystemInfo({
            success: function (res) {
              var clientHeight = res.windowHeight,
                clientWidth = res.windowWidth,
                rpxR = 750 / clientWidth
              var calc = clientHeight * rpxR - 83
              if (!that.data.sw) {
                wx.hideTabBar()
                calc += 83
              }
              that.setData({
                winHeight: calc
              })
            }
          })
        })
      }
    })


    //获取联赛列表
    wx.request({
      url: config.service.competitionUrl + '/retrieve',
      success: function (res) {
        if (res.data.data) {
          //获取比赛列表
          that.data.curCompetitionId = res.data.data[that.data.currentTab].competition_id
          that.setData({
            competitionList: res.data.data
          })
          // wx.showLoading({
          //   title: '加载中',
          //   mask: true
          // })
          that.getMatchs(that.data.curCompetitionId, '', function (res) {
            that.setData({
              ["matchList." + that.data.curCompetitionId]: res.data.data
            })
          })
        }
      }
    })
  },

  // onPullDownRefresh: function () {
  //   var that = this
  //   that.getMatchs(that.data.curCompetitionId, '', function (res) {
  //     that.setData({
  //       ["matchList." + that.data.curCompetitionId]: res.data.data
  //     })
  //   })
  //   wx.stopPullDownRefresh()
  // },

  // 滚动切换当前页
  switchTab: function (e) {
    var that = this
    that.data.curCompetitionId = that.data.competitionList[e.detail.current].competition_id
    that.setData({
      currentTab: e.detail.current
    }, function () {
      that.checkCor()
      if (!that.data.matchList[that.data.curCompetitionId]) {
        // wx.showLoading({
        //   title: '加载中',
        //   mask: true
        // })
        that.getMatchs(that.data.curCompetitionId, '', function (res) {
          that.setData({
            ["matchList." + that.data.curCompetitionId]: res.data.data
          })
        })
      }
    })
  },

  // 点击标题切换当前页
  switchNav: function (e) {
    var cur = e.target.dataset.current
    if (this.data.currentTab == cur) {
      return false
    }
    else {
      this.data.curCompetitionId = this.data.competitionList[cur].competition_id
      this.setData({
        currentTab: cur
      })
    }
  },

  //判断当前滚动超过一屏时，设置tab标题滚动条。
  checkCor: function () {
    if (this.data.currentTab > 3) {
      this.setData({
        scrollLeft: 300
      })
    } else {
      this.setData({
        scrollLeft: 0
      })
    }
  },

  showTip: function () {
    wx.showModal({
      title: '猜猜看说明',
      content: '预测90分钟内（含伤停补时，不含加时赛和点球大战）的比赛比分',
      showCancel: false
    })
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
          if (res.data.code==0) {
            var match = that.data.matchList[e.target.dataset.match.competition_id].find(function (match) {
              return match.match_id == e.target.dataset.match.match_id
            })
            if (!e.target.dataset.match.paul_id) match.paul_id = res.data.data['0']
            match.paul_home = that.data.multiArray[0][e.detail.value[0]]
            match.paul_away = that.data.multiArray[2][e.detail.value[2]]
            that.setData({
              matchList: that.data.matchList
            })
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
            that.onLoad()
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
                that.data.matchList = {}
                that.getMatchs(that.data.curCompetitionId, '', function (res) {
                  that.data.matchList[that.data.curCompetitionId] = res.data.data
                  that.setData({
                    matchList: that.data.matchList
                  })
                })//刷新获取以前预测过的比赛信息
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

  getMatchs: function (competitionId, startDate, cb, down = 1) {
    var that = this
    var options = {
      login: true,
      data: {
        competitionId: competitionId,
        startDate: startDate,
        down: down
      },
      success: cb,
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
    wx.showLoading({
      title: '加载中',
      mask: true
    })
    if (wx.getStorageSync('logged')) {  // 使用 qcloud.request 带登录态登录
      options.url = config.service.matchWithPaulUrl
      qcloud.request(options)
    }
    else {    // 使用 wx.request 则不带登录态
      options.url = config.service.matchUrl + '/retrieve'
      wx.request(options)
    }
  },

  onShareAppMessage: function (res) {
  },

  scrollToUp: function (e) {
    var that = this
    var length = this.data.matchList[this.data.curCompetitionId].length
    var startDate = (length == 0 ? '' : this.data.matchList[this.data.curCompetitionId][0].match_time)
    // wx.showLoading({
    //   title: '加载中',
    //   mask: true
    // })
    this.getMatchs(this.data.curCompetitionId, startDate, function (res) {
      if (that.data.matchList[that.data.curCompetitionId].length) {
        for (var i in res.data.data) {
          var reMatch = that.data.matchList[that.data.curCompetitionId].find(function (match) {
            return match.match_id == res.data.data[i].match_id
          })
          if (!reMatch) {
            that.data.matchList[that.data.curCompetitionId].unshift(res.data.data[i])
          }
        }
      }
      else {
        that.data.matchList[that.data.curCompetitionId] = res.data.data
      }
      that.setData({
        ["matchList." + that.data.curCompetitionId]: that.data.matchList[that.data.curCompetitionId]
      })
    }, 0)

  },
  scrollToLow: function () {
    var that = this
    var length = this.data.matchList[this.data.curCompetitionId].length
    var startDate = (length == 0 ? '' : this.data.matchList[this.data.curCompetitionId][length - 1].match_time)
    // wx.showLoading({
    //   title: '加载中',
    //   mask: true
    // })
    this.getMatchs(this.data.curCompetitionId, startDate, function (res) {
      if (that.data.matchList[that.data.curCompetitionId].length) {
        for (var i in res.data.data) {
          var reMatch = that.data.matchList[that.data.curCompetitionId].find(function (match) {
            return match.match_id == res.data.data[i].match_id
          })
          if (!reMatch) {
            that.data.matchList[that.data.curCompetitionId].push(res.data.data[i])
          }
        }
      }
      else {
        that.data.matchList[that.data.curCompetitionId] = res.data.data
      }
      that.setData({
        ["matchList." + that.data.curCompetitionId]: that.data.matchList[that.data.curCompetitionId]
      })
    })
  },
  showDetail: function (e) {
    if (this.data.sw) {
      wx.navigateTo({
        url: 'detail?matchId=' + e.currentTarget.id
      })
    }
  },
  stopBubble: function () { }
})