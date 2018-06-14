/**
 * ajax 服务路由集合
 */
const router = require('koa-router')({
  prefix: '/weapp'
})
const controllers = require('../controllers')

// 从 sdk 中取出中间件
// 这里展示如何使用 Koa 中间件完成登录态的颁发与验证
const { auth: { authorizationMiddleware, validationMiddleware } } = require('../qcloud')

// --- 登录与授权 Demo --- //
// 登录接口
router.get('/login', authorizationMiddleware, controllers.login)
// 用户信息接口（可以用来验证登录态）
router.get('/user', validationMiddleware, controllers.user)

// --- 图片上传 Demo --- //
// 图片上传接口，小程序端可以直接将 url 填入 wx.uploadFile 中
router.post('/upload', controllers.upload)

// --- 信道服务接口 Demo --- //
// GET  用来响应请求信道地址的
router.get('/tunnel', controllers.tunnel.get)
// POST 用来处理信道传递过来的消息
router.post('/tunnel', controllers.tunnel.post)

// --- 客服消息接口 Demo --- //
// GET  用来响应小程序后台配置时发送的验证请求
router.get('/message', controllers.message.get)
// POST 用来处理微信转发过来的客服消息
router.post('/message', controllers.message.post)

//通过联赛标识分页查询比赛信息（小程序）
router.get('/match/retrieve', controllers.match.retrieve)
//通过比赛ID查询比赛信息（小程序）
router.get('/match/matchInfo', controllers.match.getMatchById)

//添加或更新预测信息（小程序）
router.post('/paul/put', validationMiddleware, controllers.paul.put)
//获取预测统计信息（小程序）
router.get('/paul/count', validationMiddleware, controllers.paul.count)
//获取预测排行信息（小程序）
router.get('/paul/rank', controllers.paul.rank)
//获取预测排行信息（小程序）new
router.get('/paul/getRank', controllers.paul.getRank)
//获取包含当前用户排行的排行信息（小程序）
router.get('/paul/rankWithUser', validationMiddleware, controllers.paul.rankWithUser)
//获取预测得分统计信息（小程序）
router.get('/paul/top', controllers.paul.paulTop)
//获取胜负平统计信息（小程序）
router.get('/paul/stat', controllers.paul.paulStat)


//通过用户open_id查询带预测信息的比赛信息（小程序）
router.get('/matchWithPaul', controllers.match.retrieve, validationMiddleware, controllers.paul.matchWithPaul)

//通过用户open_id查询带预测信息的比赛信息（小程序）
router.get('/matchInfoWithPaul', controllers.match.getMatchById, validationMiddleware, controllers.paul.matchInfoWithPaul)

//查询有效赛事信息（小程序&管理后台）
router.get('/competition/retrieve', controllers.competition.retrieve)


//通过联赛标识查询比赛信息（管理后台）
router.get('/match/retrieveAll', controllers.match.retrieveAll)
//添加比赛信息（管理后台）
router.post('/match/create', controllers.match.create)
//更新比赛信息和预测得分（管理后台）
router.post('/match/update', controllers.match.update)

//查询所有赛事信息（管理后台）
router.get('/competition/retrieveAll', controllers.competition.retrieveAll)
//添加赛事信息（管理后台）
router.post('/competition/create', controllers.competition.create)
//更新赛事信息（管理后台）
router.post('/competition/update', controllers.competition.update)

//查询球队信息（管理后台）
router.get('/team/retrieve', controllers.team.retrieve)
//添加球队信息（管理后台）
router.post('/team/create', controllers.team.create)
//更新球队信息（管理后台）
router.post('/team/update', controllers.team.update)



router.get('/backend', controllers.competition.retrieve, controllers.backend.renderIndex)

router.get('/backend/:competitionId', controllers.competition.retrieve,controllers.backend.renderMatch,controllers.match.retrieveAll)

router.post('/backend/put',controllers.backend.putMatch)

router.get('/backend/config/competition',controllers.competition.retrieveAll,controllers.backend.renderCompetition)

router.post('/backend/config/competition/put',controllers.backend.putCompetition)

router.get('/backend/config/team',controllers.team.retrieve,controllers.backend.renderTeam)

router.post('/backend/config/team/put',controllers.backend.putTeam)


router.get('/switch',controllers.switch)

module.exports = router
