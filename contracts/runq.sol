// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TestVaultFixed {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        // FIX: Update state BEFORE external call (prevents reentrancy)
        balances[msg.sender] -= amount;
        
        (bool sent,) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send");
    }
}
