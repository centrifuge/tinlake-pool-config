pragma solidity ^0.6.7;
pragma experimental ABIEncoderV2;

struct Pool {
    address pool;
    bool    live;
    string  name;
    string  data;
}

contract Registry {
    Pool[] public pools;
    mapping (address => uint) lookup;


    constructor() public {
        pools.push(Pool(address(this), false, "registry", ""));
    }

    function file(address pool, bool live, string memory name, string memory data) public {
        Pool memory p = Pool(pool, live, name, data);
        uint index = lookup[pool];
        if (index > 0) {
            pools[index] = p;
        } else {
            pools.push(p);
            lookup[pool] = pools.length -1;
        }
    }

    function find(address pool) public view returns (Pool memory) {
        require(lookup[pool]>0, "pool-not-found");
        return pools[lookup[pool]];
    }

}
