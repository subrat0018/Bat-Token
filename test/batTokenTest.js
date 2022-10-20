const BatToken = artifacts.require("BatToken");
contract("BatToken",()=>{
    it("The Name of the Token is Bat Token",async ()=>
    {
        let batToken = await BatToken.deployed();
        let name = await batToken.name();
        assert(name === "Bat Token" , `The name of the token must be Bat Token but found ${name}`);
    })
});