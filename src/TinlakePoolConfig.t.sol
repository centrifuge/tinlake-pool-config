pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./TinlakePoolConfig.sol";

contract TinlakePoolConfigTest is DSTest {
    TinlakePoolConfig config;

    function setUp() public {
        config = new TinlakePoolConfig();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
