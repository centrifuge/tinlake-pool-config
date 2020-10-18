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


```
Usage: pool <command> [<args>]
   or: pool help <command>

Update pool metadata on chain and on IPFS

Special commands:

   --registry-address  prints current registry address

Commands:

   check-registry  check if the onchain registry needs an update
   help            print help about pool(1) or one of its subcommands
   list            list available pools locally
   update          update pool metadata

Report bugs to <https://github.com/centrifuge/tinlake-pools-config>.
```

### Deployment
To create a new pool registry, deploy it with:
```
    dapp create --verify "src/registry.sol:PoolRegistry"
```
