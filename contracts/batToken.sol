// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;
contract BatToken
{
    //Variables 
    string public name;
    string public symbol;
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    address owner;

    //Events
    event Transfer(address indexed _from , address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);

    constructor(uint _totalSupply)
    {
        name = "Bat Token";
        symbol = "BAT";
        totalSupply = _totalSupply;
        owner = msg.sender;
        balanceOf[owner] = _totalSupply;
    }

    //Functions
    function transfer(address _to,uint _value) public returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value, "Insufficient tokens");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    function approve(address _spender,uint _value) public returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value,"Insufficient tokens");
        allowance[msg.sender][_spender] = _value;
        balanceOf[msg.sender] -= _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    function transferFrom(address _from,address _to,uint _value) public returns(bool success)
    {
        require(allowance[_from][msg.sender] >= _value,"You are not allowed to spend above your allowance");
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}
