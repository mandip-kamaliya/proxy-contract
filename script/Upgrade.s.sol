// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/CounterV2.sol";
import "../src/ProxyContract.sol";

contract UpgradeScript is Script {
    function run() external {
        address payable PROXY_ADDRESS = payable(vm.envAddress("PROXY"));

        vm.startBroadcast();
        CounterV2 v2 = new CounterV2();
        ProxyContract proxy = ProxyContract(PROXY_ADDRESS);

        proxy.upgrade(address(v2));

        console.log("Upgraded to CounterV2:", address(v2));

        vm.stopBroadcast();
    }
}
