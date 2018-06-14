/**
 * 小程序配置文件
 */

// var host = 'http://localhost:5757';//本地环境
var host = 'https://jemhkbux.qcloud.la';//开发环境
// var host = 'https://752222465.paul-mp.xyz';//生产环境
var config = {

    service: {
        host,

        loginUrl: `${host}/weapp/login`,

        requestUrl: `${host}/weapp/user`,

        matchUrl:`${host}/weapp/match`,

        competitionUrl: `${host}/weapp/competition`,

        paulUrl: `${host}/weapp/paul`,

        matchWithPaulUrl:`${host}/weapp/matchWithPaul`, 

        matchInfoWithPaulUrl: `${host}/weapp/matchInfoWithPaul`,  //单场比赛 

        switchUrl: `${host}/weapp/switch`, 
    },

    cosUrl: 'https://paul-1256703356.cossh.myqcloud.com/team/'
};

module.exports = config;
