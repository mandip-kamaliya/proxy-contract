// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/CounterV1.sol";
import "../src/CounterV2.sol";
import "../src/ProxyContract.sol";

contract ProxyTest is Test {
    ProxyContract proxy;

     function setUp() public {
        CounterV1 v1 = new CounterV1();
        proxy = new ProxyContract(address(v1));
    }

     function testV1Logic() public {
        CounterV1 proxyAsV1 = CounterV1(address(proxy));

        proxyAsV1.increment();
        uint256 count =
        uint256(vm.load(address(proxy), bytes32(uint256(0))));
    assertEq(count, 1);
    }

   function testUpgradeToV2() public {
    CounterV1 proxyAsV1 = CounterV1(address(proxy));
    proxyAsV1.increment();

    CounterV2 v2 = new CounterV2();
    proxy.upgrade(address(v2));

    CounterV2 proxyAsV2 = CounterV2(address(proxy));
    proxyAsV2.increment();

    uint256 count =
        uint256(vm.load(address(proxy), bytes32(uint256(0))));
    assertEq(count, 3);
}
}