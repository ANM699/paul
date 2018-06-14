const { mysql } = require('../qcloud')

module.exports = async (ctx, next) => {
        let sw = await mysql('switch')
        ctx.state.data = sw[0].switch
}
