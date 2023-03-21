// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract DogCoin {
    struct Payment {
        uint256 amount;
        address recipient;
    }

    // State Variables

    /// Deployer of the contract
    address private owner;

    /// Total Supply of DogCoin
    uint256 maxSupply = 2000000 * 10 ** 18;

    /// Track  the number of DogCoin own by a user
    mapping(address => uint256) public balances;

    /// Tracks the payments of users
    mapping(address => Payment[]) payments;

    // Modifier

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not ollowed to.");
        _;
    }

    // Events
    /// Logs the changes of the Total Supply
    event TotalSupplyChanged(uint256);

    /// Logs the transfer of DogCoin between users
    event TransferDogCoin(uint256, address);

    constructor() {
        owner = msg.sender;
        balances[owner] = maxSupply;
    }

    function getMaxSupply() public view returns (uint256) {
        return maxSupply;
    }

    function increaseSupply() public onlyOwner {
        maxSupply += 1000;
        emit TotalSupplyChanged(maxSupply);
    }

    function transfer(uint256 _amount, address _recipient) public {
        // Check if the sender has enough before making the transfer
        require(balances[msg.sender] >= _amount, "Not enough Token");

        balances[_recipient] += _amount;
        balances[msg.sender] -= _amount;

        emit TransferDogCoin(_amount, _recipient);
    }

    function _mint(uint256 _amount) private onlyOwner {
        balances[owner] += _amount;
    }
}
