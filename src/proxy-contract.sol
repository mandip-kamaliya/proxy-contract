// SPDX-License-Identifier: MIT

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

    fallback() external payable {
        address impl = imlementaition;

        assembly {
            calldatacopy(0, 0, calldatasize())

            let result := delegatecall(gas(), impl, 0, calldatasize(), 0, 0)

            returndatacopy(0, 0, returndatasize())

            switch result
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }
}
