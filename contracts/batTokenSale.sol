//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.1;

//1.Provisions Token to tokenSale contract
//2.Set a token Price in Wei
//3.Assign an Admin
//4.Buy Tokens
//5.End Sale
import "./batToken.sol";
contract BatTokenSale
{
    address owner;
    uint public tokenPrice;
    BatToken public tokenContract;
    uint totalTokenSale;

    //Events
    event Sell(address _buyer,uint _amount);

    constructor(uint _tokenPrice,BatToken _tokenContract)
    {
        owner = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
    function getAdmin() public view returns(address)
    {
        return owner;
    }
    function endSale() public
    {
        require(msg.sender == owner,"You are not Authorized to do this");
        require(tokenContract.transfer(msg.sender, tokenContract.balanceOf(address(this))),"Transfermation failed");
        selfdestruct(payable(owner));
    }
    function buyToken(uint _numberOfTokens) public payable
    {
        require(msg.value == _numberOfTokens * tokenPrice , "The ehter recived is not exactly equal to token amount");
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens,"Contract has Insufficient Balance");
        require(tokenContract.transfer(msg.sender, _numberOfTokens),"Transfering failed");

        totalTokenSale += _numberOfTokens;
        emit Sell(msg.sender,_numberOfTokens);
    }

}
