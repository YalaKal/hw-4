// SPDX-License-Identifier: None

pragma solidity 0.8.17;

contract BootcampContract {
    // Add a variable to hold the address of the deployer
    address public immutable deployer;

    uint256 number;

    constructor() {
        deployer = msg.sender;
    }

    function store(uint256 num) public {
        number = num;
    }

    function retrieve() public view returns (uint256) {
        return number;
    }

    /**
     * @dev This function checks if the caller is the deployer and
     *
     * @return - Returns a specific address if deployer is the caller or the deployer address if not
     */

    function getAddress() external view returns (address) {
        if (msg.sender == deployer) {
            return address(0x000000000000000000000000000000000000dEaD);
        } else {
            return deployer;
        }
    }
}
