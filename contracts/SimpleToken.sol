// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    mapping(address => uint256) public balanceOf;

    function mint(uint256 amount) public {
        balanceOf[msg.sender] += amount;
    }
}
