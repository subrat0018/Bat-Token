// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
contract BatToken
{
    string public name;
    string public symbol;
    uint public totalSupply;
    mapping(address => uint) public balanceOf;

    constructor(uint _totalSupply)
    {
        name = "Bat Token";
        symbol = "BAT";
        totalSupply = _totalSupply;
    }
}
