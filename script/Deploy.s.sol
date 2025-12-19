// SPDX-License-Identifier : MIT

pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/CounterV1.sol";
import "../src/ProxyContract.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();
        CounterV1 V1 = new CounterV1();
        ProxyContract proxy = new ProxyContract(address(V1));

        console.log("counterV1:", address(v1));
        console.log("proxy:", address(proxy));
        vm.stopBroadcast();
    }
}
