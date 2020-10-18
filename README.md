# tinlake-pool-metadata
This repo stores pool metadata of active tinlake pools along with an on chain registry.

## Setup
1) Install dependencies with `npm install`
2) Get an API key on pinata and set the env variables `PINATA_API_KEY` and `PINATA_SECRET_KEY`
3) Set the `dapp` typical env variables (`ETH_RCP_URL`,

## PoolRegistry
### Usage
The registry keeps track of a list of addresses along with their short name and pool metadata IPFS hash.

### `pool` CLI
### Deployment
To create a new pool registry, deploy it with:
```
    dapp create --verify "src/registry.sol:PoolRegistry"
```
