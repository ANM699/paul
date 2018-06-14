// pages/user/index.js
import * as echarts from '../../components/ec-canvas/echarts'

var qcloud = require('../../vendor/wafer2-client-sdk/index')
var config = require('../../config')
var util = require('../../utils/util.js')

var app = getApp()

let chart = {}
function initChart(canvas, width, height) {
  chart = echarts.init(canvas, null, {
    width: width,
    height: height
  });
  canvas.setChart(chart);

  var option = {
    title: {
      padding: 0,
      text: '0',
      left: 'center',
      top: 'center',
      textStyle: {
        fontSize: 45
      },
      subtext: '总积分'
    },
    color: ["#f76260", "#ffbe00", "#2cc17b"],
    series: [{
      type: 'pie',
      center: ['50%', '50%'],
      radius: ['55%', '85%'],
      labelLine: {
        normal: {
          show: false
        }
      },
      itemStyle: {
        emphasis: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 2, 2, 0.3)'
        }
      },
      data: [0, 0, 0]
    }]
  };

  chart.setOption(option);
  return chart;
}

Page({
  data: {
    logged: wx.getStorageSync('logged'),
    chartData: [0, 0, 0],
    ec: {
      onInit: initChart
    }
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
              if (wx.getStorageSync('logged')) {
                // wx.showLoading({
                //   title: '加载中',
                //   mask: true
                // })
                that.getPaulCount()
              }
              else {
                that.setData({
                  chartData: [0, 0, 0]
                }),
                  chart.setOption({
                    title: {
                      text: '0'
                    },
                    series: [{
                      data: [0, 0, 0]
                    }]
                  })
              }
            })
        }
      }
    })
  },

  onLoad: function () {
    if (wx.getStorageSync('logged')) {
      this.setData({
        logged: true
      })
      // wx.showLoading({
      //   title: '加载中',
      //   mask: true
      // })
      this.getPaulCount()
    }
    else{
      this.setData({
        logged: false
      })
    }
  },

  showTip: function () {
    wx.showModal({
      title: '积分计算规则',
      content: '猜中比分得3分；猜对胜负得1分；猜错胜负不得分',
      showCancel: false
    })
  },

  login: function (e) {
    var that = this
    if (e.detail.userInfo) {
      // 调用登录接口
      if (!wx.getStorageSync('logged')) {
        wx.showLoading({
          title: '加载中',
          mask: true
        })
        // 调用登录接口
        qcloud.login({
          success() {
            wx.setStorageSync('logged', true)
            that.setData({
              logged: true
            }, function () {
              that.getPaulCount()
            })
          },
          fail(error) {
            wx.showToast({
              title: '授权失败'
            })
            // util.showModel('授权失败', error)
            console.log('login fail', error)
          }
        })
      }
    }
  },

  getPaulCount: function () {
    var that = this
    var options = {
      url: config.service.paulUrl + '/count',
      login: true,
      success: function (res) {
        var chartData = [0, 0, 0]
        var paulSum = 0
        for (var i in res.data.data) {
          paulSum += res.data.data[i].paul_score * res.data.data[i].ct
          switch (res.data.data[i].paul_score) {
            case 0:
              chartData[0] = res.data.data[i].ct
              break
            case 1:
              chartData[1] = res.data.data[i].ct
              break
            case 3:
              chartData[2] = res.data.data[i].ct
              break
            default:
              break
          }
        }
        that.setData({
          chartData: chartData
        })
        chart.setOption({
          title: {
            text: paulSum
          },
          series: [{
            data: chartData,
          }]
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
    qcloud.request(options)
  },

  // onPullDownRefresh: function () {
  //   if (this.data.logged) this.getPaulCount()
  //   wx.stopPullDownRefresh()
  // },

  onShareAppMessage: function (res) {
    return {
      title: '保罗or贝利？预测帝or乌鸦嘴？'
    }
  }
})