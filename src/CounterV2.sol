// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CounterV2 {
    uint256 public count;

    function increment() external {
        count += 1;
    }

    function decrememnt() external {
        count -= 1;
    }
}
