const kovanStaging = require('./kovan-staging.json');
const mainnetProduction = require('./mainnet-production.json');

const poolConfigs = {
    kovanStaging,
    mainnetProduction
}

console.log(poolConfigs);

module.exports = poolConfigs

