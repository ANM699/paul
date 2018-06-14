const moment = require('moment')
const { mysql } = require('../qcloud')
const match = require('./match')
const competition = require('./competition')
const team = require('./team')
//渲染首页
async function renderIndex(ctx) {
    await ctx.render('index', { competitions: ctx.state.data, matchs: null, competitionId: 0, layout: false })
}


async function renderMatch(ctx, next) {
    let competitions = ctx.state.data
    for (let index = 0; index < competitions.length; index++) {
        if (competitions[index].competition_id == ctx.params.competitionId) {
            ctx.state.competitionId = competitions[index].competition_id
            break
        }
    }
    await next()
    let matchs = ctx.state.matchs
    await ctx.render('index', { competitions: competitions, matchs: matchs, competitionId: ctx.state.competitionId, moment: moment, layout: false })
}

async function putMatch(ctx) {
    if (ctx.request.body) {
        ctx.request.body.score_home = ctx.request.body.score_home ? ctx.request.body.score_home : null
        ctx.request.body.score_away = ctx.request.body.score_away ? ctx.request.body.score_away : null
        ctx.request.body.enable = ctx.request.body.enable ? 1 : 0
        if (ctx.request.body.match_id) {
            await match.update(ctx)

        } else {
            await match.create(ctx)
        }
        ctx.response.redirect('/weapp/backend/' + ctx.request.body.competition_id)
    }
}

async function renderCompetition(ctx) {
    await ctx.render('competition', { competitions: ctx.state.data, layout: false })
}

async function putCompetition(ctx) {
    if (ctx.request.body) {
        ctx.request.body.enable = ctx.request.body.enable ? 1 : 0
        if (ctx.request.body.competition_id) {
            await competition.update(ctx)
            ctx.response.redirect('/weapp/backend/config/competition')

        } else {
            await competition.create(ctx)
            ctx.response.redirect('/weapp/backend/config/competition')
        }
    }
}

async function renderTeam(ctx) {
    await ctx.render('team', { teams: ctx.state.data, layout: false })
}

async function putTeam(ctx) {
    if (ctx.request.body) {
        if (ctx.request.body.team_id) {
            await team.update(ctx)
            ctx.response.redirect('/weapp/backend/config/team')

        } else {
            await team.create(ctx)
            ctx.response.redirect('/weapp/backend/config/team')
        }
    }
}

module.exports = {
    renderIndex,
    renderMatch,
    putMatch,
    renderCompetition,
    putCompetition, 
    renderTeam,
    putTeam
}