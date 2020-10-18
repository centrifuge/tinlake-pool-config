const fs = require('fs')

function loadMetadata(folder) {
  let pools = [];
  fs.readdirSync(folder).forEach(function(file) {
    if (file.match(/\.json$/) !== null) {
      var name = file.replace('.js', '')
      pools.push(require(folder + file));
    }
  });
  return pools;
}

const kovanPools = __dirname + '/pools/kovan/metadata/'
const mainnetProduction = require('./mainnet-production.json');

const poolConfigs = {
  kovanStaging: loadMetadata(kovanPools),
  mainnetProduction
}
console.log(poolConfigs)
module.exports = poolConfigs
