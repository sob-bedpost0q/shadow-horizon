// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVault {
    address public owner;

    event Deposit(address indexed from, uint256 amount);
    event Withdrawal(address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external onlyOwner {
        require(amount <= address(this).balance, "Insufficient funds");
        payable(owner).transfer(amount);
        emit Withdrawal(owner, amount);
    }

    function getVaultBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
