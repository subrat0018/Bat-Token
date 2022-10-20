const BatToken = artifacts.require("BatToken");
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
    })
});