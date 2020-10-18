pragma solidity ^0.5.15;
pragma experimental ABIEncoderV2;

import "tinlake-auth/auth.sol";

contract PoolRegistry is Auth {
    struct Pool {
        address pool;
        bool    live;
        string  name;
        string  data;
    }

    event PoolCreated(address pool, bool live, string name, string data);
    event PoolUpdated(address pool, bool live, string name, string data);



    Pool[] public pools;
    mapping (address => uint) public lookup;


    constructor() public {
        wards[msg.sender] = 1;
        pools.push(Pool(address(this), false, "registry", ""));
    }

    function file(address pool, bool live, string memory name, string memory data) public auth {
        Pool memory p = Pool(pool, live, name, data);
        if (address(this) == pool) {
            pools[0] = p;
            return;
        }

        uint index = lookup[pool];
        if (index > 0) {
            pools[index] = p;
            emit PoolUpdated(pool, live, name, data);
        } else {
            pools.push(p);
            lookup[pool] = pools.length -1;
            emit PoolCreated(pool, live, name, data);
        }
    }

    function find(address pool) public view returns (bool live, string memory name, string memory data) {
        require(lookup[pool]>0, "pool-not-found");
        Pool memory p = pools[lookup[pool]];
        return (p.live, p.name, p.data);
    }

}
