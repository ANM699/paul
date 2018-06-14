const { mysql } = require('../qcloud')

async function retrieve(ctx,next) {
  ctx.state.data = await mysql('teams')
  return next()
}

async function create(ctx) {
  delete ctx.request.body.team_id
  ctx.state.data = await mysql('teams').returning('team_id').insert(ctx.request.body)
}

//
async function update(ctx) {
  let teamId = ctx.request.body.team_id
  delete ctx.request.body.team_id
  await mysql('teams').where('team_id', teamId).update(ctx.request.body)
}

module.exports = {
  retrieve,
  create,
  update
}

