const { mysql } = require('../qcloud')
const config = require('../config')
const moment = require('moment')

async function retrieve(ctx, next) {
  if (ctx.query.competitionId) {
    let competitionId = ctx.query.competitionId

    // ctx.state.data = await mysql('matchs').where({ competition_id: competitionId, enable: 1 }).orderByRaw('match_time ASC,round ASC')

    let startDate = ctx.query.startDate ? moment(ctx.query.startDate).format('YYYY-MM-DD HH:mm') : moment().format('YYYY-MM-DD HH:mm')

    if (parseInt(ctx.query.down)) {//向下查询25条
      ctx.state.data = await mysql('matchs').where({ competition_id: competitionId, enable: 1 }).andWhere('match_time', '>=', startDate).orderByRaw('match_time ASC,round ASC').limit(25)
    }
    else {//向上查询25条
      ctx.state.data = await mysql('matchs').where({ competition_id: competitionId, enable: 1 }).andWhere('match_time', '<=', startDate).orderByRaw('match_time DESC,round DESC').limit(25)
    }

    for (let index = 0; index < ctx.state.data.length; index++) {
      let item = ctx.state.data[index];
      item.logo_home = config.cosUrl + item.home + '.png'
      item.logo_away = config.cosUrl + item.away + '.png'
    }
  }
  else {
    ctx.state.data = await mysql('matchs').where('enable', 1)
  }
  return next()
}

async function create(ctx) {
  delete ctx.request.body.match_id
  ctx.state.data = await mysql('matchs').returning('match_id').insert(ctx.request.body)
}

//
async function update(ctx, next) {
  // let matchId = ctx.request.body.match_id
  // delete ctx.request.body.match_id
  // await mysql('matchs').where('match_id', matchId).update(ctx.request.body)

  // if (ctx.request.body.score_home && ctx.request.body.score_away) {
  //   ctx.state.data = ctx.request.body
  //   ctx.state.data.match_id = matchId
  //   return next()
  // }


  let match = ctx.request.body
  let match_id = Number.parseInt(match.match_id)

  await mysql.transaction(async function (trx) {

    delete match.match_id
    await trx('matchs').where('match_id', match_id).update(match)

    if (match.score_home && match.score_away) {

      let score_home = Number.parseInt(match.score_home)
      let score_away = Number.parseInt(match.score_away)
      let diff = score_home - score_away

      await trx('paul').update({ paul_score: 3 }).where({ match_id: match_id, paul_home: score_home, paul_away: score_away })

      await trx('paul').update({ paul_score: 1 }).whereRaw('match_id=? AND (paul_home!=? OR paul_away!=?) AND (?*(cast(paul_home as signed)-cast(paul_away as signed))>0 OR (?*(cast(paul_home as signed)-cast(paul_away as signed))=0 AND cast(paul_home as signed)-cast(paul_away as signed)=?))', [match_id, score_home, score_away, diff, diff, diff])

      await trx('paul').update({ paul_score: 0 }).whereRaw('match_id=? AND (?*(cast(paul_home as signed)-cast(paul_away as signed))<0 OR (?*(cast(paul_home as signed)-cast(paul_away as signed))=0 AND cast(paul_home as signed)-cast(paul_away as signed)!=?))', [match_id, diff, diff, diff])
    }
    else{
      await trx('paul').update({ paul_score: 0 }).whereRaw('match_id=?', [match_id])
    }
  })
}


async function retrieveAll(ctx) {
  if (ctx.state.competitionId) {
    let competitionId = ctx.state.competitionId
    ctx.state.matchs = await mysql('matchs').where({ competition_id: competitionId }).orderByRaw('match_time ASC,round ASC')
  }
  else {
    ctx.state.matchs = await mysql('matchs')
  }
}


async function getMatchById(ctx, next) {
  let matchId = ctx.query.matchId
  let matchInfo = await mysql('matchs').where('match_id', matchId).join('competitions', 'matchs.competition_id', 'competitions.competition_id')
  if (matchInfo[0]) {
    matchInfo[0].logo_home = config.cosUrl + matchInfo[0].home + '.png'
    matchInfo[0].logo_away = config.cosUrl + matchInfo[0].away + '.png'
  }
  ctx.state.data = matchInfo[0]
  return next()
}

module.exports = {
  retrieve,
  create,
  update,
  retrieveAll,
  getMatchById
}

