const BatToken = artifacts.require("BatToken");
const { assert } = require("console");
let Web3 = require("web3");
let web3 = new Web3("HTTP://127.0.0.1:7545");
contract("BatToken",()=>{
    it("The Name of the Token must be Bat Token",async ()=>
    {
        let batToken = await BatToken.deployed();
        let name = await batToken.name();
        assert(name === "Bat Token" , `The name of the token must be 'Bat Token' but found ${name}`);
    });
    it("The symbol of the Token must be BAT",async ()=>
    {
        let batToken = await BatToken.deployed();
        let symbol = await batToken.symbol();
        assert(symbol === "BAT",`The symbol of the Token must be 'BAT' but found ${symbol} `);
    });
    it("The total Supply must 1 million",async ()=>
    {
        let batToken = await BatToken.deployed();
        let totalSupply = await batToken.totalSupply();
        assert(totalSupply.toNumber() === 1000000,`total supply must be 1000000 but found but found ${totalSupply}`);
    });
    it("Transfer must be work properly",async ()=>
    {
        let batToken = await BatToken.deployed();
        let acc = await web3.eth.getAccounts();
        try{
            await batToken.transfer(acc[1],100000000000);
            assert.fail();
        }
        catch(err)
        {
            assert(err.message.indexOf("revert") >= 0,"The balance of the account doesn't have enough money but your code is not throwing error");
        }
        let evt = await batToken.transfer(acc[1],250000,{from:acc[0]});
        let money = await batToken.balanceOf(acc[0]);
        assert(money.toNumber() === 750000,"Money is not getting deducted");
        money = await batToken.balanceOf(acc[1]);
        assert(money.toNumber(),250000,"Money is not getting added");


    })
});