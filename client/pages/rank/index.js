// pages/rank/index.js
var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')
var app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    winHeight: 0,//窗口高度
    currentTab: 0, //预设当前项的值
    scrollLeft: 0, //tab标题的滚动条位置
    curCompetitionId: 0,
    rank: {},
    competitionList: [],
    logged: wx.getStorageSync('logged')
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
              that.data.rank = {}
              that.getRank(that.data.curCompetitionId)
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
    //  高度自适应
    wx.getSystemInfo({
      success: function (res) {
        var clientHeight = res.windowHeight,
          clientWidth = res.windowWidth,
          rpxR = 750 / clientWidth
        var calc = clientHeight * rpxR - 143
        // console.log(calc)
        that.setData({
          winHeight: calc
        })
      }
    })

    //获取联赛列表
    wx.request({
      url: config.service.competitionUrl + '/retrieve',
      success: function (res) {
        if (res.data.data) {
          //获取比赛列表

          that.setData({
            competitionList: res.data.data,
            curCompetitionId: res.data.data[that.data.currentTab].competition_id
          }, function () {
            // wx.showLoading({
            //   title: '加载中',
            //   mask: true
            // })
            that.getRank(that.data.curCompetitionId)
          })
        }
      }
    })
  },

  // onPullDownRefresh: function () {
  //   var that = this
  //   that.getRank(that.data.curCompetitionId)
  //   wx.stopPullDownRefresh()
  // },

  // 滚动切换当前页
  switchTab: function (e) {
    var that = this

    that.setData({
      currentTab: e.detail.current,
      curCompetitionId: that.data.competitionList[e.detail.current].competition_id
    }, function () {
      that.checkCor()
      if (!that.data.rank[that.data.curCompetitionId]) {
        // wx.showLoading({
        //   title: '加载中',
        //   mask: true
        // })
        that.getRank(that.data.curCompetitionId)
      }
    })
  },

  // 点击标题切换当前页
  switchNav: function (e) {
    var that=this
    var cur = e.target.dataset.current
    if (this.data.currentTab == cur) {
      return false
    }
    else {
      this.setData({
        currentTab: cur,
        curCompetitionId: that.data.competitionList[cur].competition_id
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
      title: '排行规则',
      content: '依次按照以下规则排序的前100名：积分由高至低>>总场次由少至多>>3分场次由多至少>>1分场次由多至少',
      showCancel: false
    })
  },

  getRank: function (competitionId) {
    var that = this
    var options = {
      // url: config.service.paulUrl + '/rank',
      login: true,
      data: {
        competitionId: competitionId,
      },
      success: function (res) {
        // console.log(res)
        if (res.data.data.rankList.length) {
          res.data.data.rankList.map(function (item) {
            item.user_info = JSON.parse(item.user_info)
          })
        }
        if (res.data.data.myRank) {
          res.data.data.myRank.user_info = JSON.parse(res.data.data.myRank.user_info)
        }
        else {
          res.data.data.myRank = null
        }
        that.setData({
          ["rank." + that.data.curCompetitionId]: res.data.data
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

    wx.showLoading({
      title: '加载中',
      mask: true
    })
    if (wx.getStorageSync('logged')) {  // 使用 qcloud.request 带登录态登录
      options.url = config.service.paulUrl + '/rankWithUser',
        qcloud.request(options)
    }
    else {    // 使用 wx.request 则不带登录态
      options.url = config.service.paulUrl + '/getRank',
        wx.request(options)
    }
    // wx.request(options)
  },

  onShareAppMessage: function (res) {
    return {
      title: '榜上有名 再接再厉'
    }
  }
})