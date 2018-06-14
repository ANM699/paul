const { mysql } = require('../qcloud')

async function retrieve(ctx, next) {
  ctx.state.data = await mysql('competitions').where('enable', 1).orderBy('order_id', 'asc')
  return next()
}

async function retrieveAll(ctx,next) {
  ctx.state.data = await mysql('competitions').orderByRaw('enable desc,order_id asc')
  return next()
}

async function create(ctx) {
  delete ctx.request.body.competition_id
  ctx.state.data = await mysql('competitions').returning('competition_id').insert(ctx.request.body)
}

//
async function update(ctx) {
  let competitionId = ctx.request.body.competition_id
  delete ctx.request.body.competition_id
  await mysql('competitions').where('competition_id', competitionId).update(ctx.request.body)
}


module.exports = {
  retrieve,
  retrieveAll,
  create,
  update
}