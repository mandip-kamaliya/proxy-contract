pragma solidity ^0.8.18;

contract proxyContract {
    address public imlementaition;
    address public admin;

    constructor(address _implementetion) {
        imlementaition = _implementetion;
        admin = msg.sender;
    }
}
