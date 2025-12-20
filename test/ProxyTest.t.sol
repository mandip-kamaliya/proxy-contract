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
}