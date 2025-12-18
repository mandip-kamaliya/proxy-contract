pragma solidity ^0.8.18;

contract proxyContract {
    address public imlementaition;
    address public admin;

    constructor(address _implementetion) {
        imlementaition = _implementetion;
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        _onlyAdmin();
        _;
    }

    function _onlyAdmin() internal view {
        require(msg.sender == admin, "only admin can call this function");
    }

    function upgrade(address _implementaition) external onlyAdmin {
        imlementaition = _implementaition;
    }
}
