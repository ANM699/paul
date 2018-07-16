const { mysql } = require('../qcloud')
const moment = require('moment')

async function matchWithPaul(ctx) {
    if (ctx.state.$wxInfo.loginState === 1) {
        // loginState 为 1，登录态校验成功
        let openId = ctx.state.$wxInfo.userinfo.openId
        let matchs = ctx.state.data
        let matchWithPaul = new Array()
        for (let index = 0; index < matchs.length; index++) {
            let item = matchs[index];
            let res = await mysql('paul').select('paul_id', 'paul_home', 'paul_away', 'paul_score').where({ match_id: item.match_id, open_id: openId })
            if (res.length > 0) {
                item.paul_id = res[0].paul_id
                item.paul_home = res[0].paul_home
                item.paul_away = res[0].paul_away
                item.paul_score = res[0].paul_score
            }
        }
    } else {
        ctx.state.code = -1
    }

}

//单场比赛
async function matchInfoWithPaul(ctx) {
    if (ctx.state.$wxInfo.loginState === 1) {
        // loginState 为 1，登录态校验成功
        let openId = ctx.state.$wxInfo.userinfo.openId
        let res = await mysql('paul').select('paul_id', 'paul_home', 'paul_away', 'paul_score').where({ match_id: ctx.state.data.match_id, open_id: openId })
        if (res.length > 0) {
            ctx.state.data.paul_id = res[0].paul_id
            ctx.state.data.paul_home = res[0].paul_home
            ctx.state.data.paul_away = res[0].paul_away
            ctx.state.data.paul_score = res[0].paul_score
        }

    } else {
        ctx.state.code = -1
    }

}

async function put(ctx) {
    let match = await mysql('matchs').where('match_id', ctx.request.body.match_id)
    if (Date.parse(match[0].match_time) > Date.now()) {
        if (ctx.state.$wxInfo.loginState === 1) {
            // loginState 为 1，登录态校验成功
            ctx.request.body.open_id = ctx.state.$wxInfo.userinfo.openId
            ctx.request.body.last_paul_time = moment().format('YYYY-MM-DD HH:mm:ss')

            let pc = await mysql('paul').count('paul_id as hasPaul').where({ open_id: ctx.request.body.open_id, match_id: ctx.request.body.match_id })

            if (ctx.request.body.paul_id == -1 && !pc[0].hasPaul) {
                //添加
                delete ctx.request.body.paul_id
                delete ctx.request.body.match_time
                ctx.state.data = await mysql('paul').returning('paul_id').insert(ctx.request.body)
            } else {
                //更新
                let paulId = ctx.request.body.paul_id
                delete ctx.request.body.paul_id
                delete ctx.request.body.match_id
                delete ctx.request.body.match_time
                await mysql('paul').where('paul_id', paulId).update(ctx.request.body, 'paul_id')
            }

        } else {
            ctx.state.code = -1
        }
    } else {
        ctx.state.code = -1
    }
}

async function count(ctx) {
    if (ctx.state.$wxInfo.loginState === 1) {
        // loginState 为 1，登录态校验成功
        let openId = ctx.state.$wxInfo.userinfo.openId
        ctx.state.data = await mysql.select('paul_score', mysql.raw('COUNT(paul_id) AS ct')).from('paul').where('open_id', openId).groupBy('paul_score').orderBy('paul_score', 'asc')
    } else {
        ctx.state.code = -1
    }
}

async function rank(ctx) {
    if (ctx.query.competitionId) {
        let competitionId = ctx.query.competitionId

        ctx.state.data = await mysql.raw('SELECT (@rownum:=@rownum+1) AS rowNum, b.*, cSessionInfo.user_info FROM ( SELECT open_id, COUNT( CASE WHEN paul_score = 3 THEN 1 ELSE NULL END ) AS win, COUNT( CASE WHEN paul_score = 1 THEN 1 ELSE NULL END ) AS draw, COUNT( CASE WHEN paul_score = 0 THEN 1 ELSE NULL END ) AS lose, COUNT(*) AS count, IFNULL(SUM(paul_score),0) AS sum FROM ( SELECT paul.open_id, paul.paul_score, matchs.competition_id FROM paul LEFT JOIN matchs ON matchs.match_id = paul.match_id WHERE paul.enable = 1 AND matchs.competition_id =' + competitionId + ') a GROUP BY open_id ) b LEFT JOIN cSessionInfo ON cSessionInfo.open_id = b.open_id,(SELECT @rownum:=0) r ORDER BY b.sum DESC,b.count ASC,b.win DESC,b.draw DESC,b.open_id ASC LIMIT 100')

    }
}

async function getRank(ctx) {
    if (ctx.query.competitionId) {
        let competitionId = ctx.query.competitionId

        ctx.state.data = {
            rankList: []
        }

        let rankList = await mysql.raw('SELECT (@rownum:=@rownum+1) AS rowNum, b.*, cSessionInfo.user_info FROM ( SELECT open_id, COUNT( CASE WHEN paul_score = 3 THEN 1 ELSE NULL END ) AS win, COUNT( CASE WHEN paul_score = 1 THEN 1 ELSE NULL END ) AS draw, COUNT( CASE WHEN paul_score = 0 THEN 1 ELSE NULL END ) AS lose, COUNT(*) AS count, IFNULL(SUM(paul_score),0) AS sum FROM ( SELECT paul.open_id, paul.paul_score, matchs.competition_id FROM paul LEFT JOIN matchs ON matchs.match_id = paul.match_id WHERE paul.enable = 1 AND matchs.competition_id =' + competitionId + ') a GROUP BY open_id ) b LEFT JOIN cSessionInfo ON cSessionInfo.open_id = b.open_id,(SELECT @rownum:=0) r ORDER BY b.sum DESC,b.count ASC,b.win DESC,b.draw DESC,b.open_id ASC LIMIT 100')

        ctx.state.data.rankList = rankList[0]
    }
}

async function rankWithUser(ctx) {
    if (ctx.query.competitionId) {
        let competitionId = ctx.query.competitionId
        let rankList = await mysql.raw('SELECT (@rownum:=@rownum+1) AS rowNum, b.*, cSessionInfo.user_info FROM ( SELECT open_id, COUNT( CASE WHEN paul_score = 3 THEN 1 ELSE NULL END ) AS win, COUNT( CASE WHEN paul_score = 1 THEN 1 ELSE NULL END ) AS draw, COUNT( CASE WHEN paul_score = 0 THEN 1 ELSE NULL END ) AS lose, COUNT(*) AS count, IFNULL(SUM(paul_score),0) AS sum FROM ( SELECT paul.open_id, paul.paul_score, matchs.competition_id FROM paul LEFT JOIN matchs ON matchs.match_id = paul.match_id WHERE paul.enable = 1 AND matchs.competition_id =' + competitionId + ') a GROUP BY open_id ) b LEFT JOIN cSessionInfo ON cSessionInfo.open_id = b.open_id,(SELECT @rownum:=0) r ORDER BY b.sum DESC,b.count ASC,b.win DESC,b.draw DESC,b.open_id ASC')

        ctx.state.data = {
            rankList: []
        }

        ctx.state.data.rankList = rankList[0].slice(0, 100)
        if (ctx.state.$wxInfo.loginState === 1) {
            // loginState 为 1，登录态校验成功
            ctx.state.data.myRank = rankList[0].find(function(rank) {
                return rank.open_id == ctx.state.$wxInfo.userinfo.openId
            })
        } else {}
        // 
    }
}

async function paulTop(ctx) {
    let matchId = ctx.query.matchId
    let paulTop = await mysql.raw('SELECT COUNT(paul_id) AS paul_ct,(paul_home+paul_away) AS paul_sum, paul_home,paul_away FROM paul WHERE match_id=' + matchId + ' GROUP BY paul_home,paul_away ORDER BY paul_ct DESC,paul_sum ASC,paul_home ASC,paul_away ASC LIMIT 5')
    ctx.state.data = paulTop[0]
}

async function paulStat(ctx) {
    let matchId = ctx.query.matchId
    let paulStat = await mysql.raw('SELECT COUNT(CASE WHEN paul_home > paul_away THEN 1 ELSE NULL END) AS home_win,COUNT(CASE WHEN paul_home = paul_away THEN 1 ELSE NULL END) AS draw,COUNT(CASE WHEN paul_home < paul_away THEN 1 ELSE NULL END) AS away_win ,COUNT(paul_id) AS total FROM `paul` WHERE match_id=' + matchId)
    ctx.state.data = paulStat[0]
}

module.exports = {
    matchWithPaul,
    put,
    count,
    rank,
    getRank,
    rankWithUser,
    paulTop,
    paulStat,
    matchInfoWithPaul
    // updatePaulScore
}