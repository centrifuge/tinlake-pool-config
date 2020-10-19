# tinlake-pool-metadata
This repo stores pool metadata of active tinlake pools along with an on chain registry.

## Data Structure
Pool metadata is stored in this repo along with the scripts used to handle it. Use the following folder structure:
```
pools/ # all pool data
    kovan/ # kovan staging pools
      metadata/ # pool config json files go here
         0x0231323[...].json # files should be named with the root
                            # address as the name if they are for a
                            # running pool
         upcoming_pool.json # Upcoming pools should not start with 0x
      assets/ # other files such as logos go here

    mainnet/ # mainnet pools enabled on tinlake.centrifuge.io should go here

## Setup
1) Install dependencies with `npm install`
2) Get an API key on pinata and set the env variables `PINATA_API_KEY` and `PINATA_SECRET_KEY`
3) Set the `dapp` typical env variables (`ETH_RCP_URL`, `ETH_FROM`, `ETH_KEYSTORE`, `ETH_PASSWORD`)

## `pool` CLI
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

Report bugs to <https://github.com/centrifuge/tinlake-pool-config>.
```

## PoolRegistry
### Usage
The registry keeps track of a list of addresses along with their short name and pool metadata IPFS hash.

### Deployment
To create a new pool registry, deploy it with:
```
    dapp create --verify "src/registry.sol:PoolRegistry"
```

