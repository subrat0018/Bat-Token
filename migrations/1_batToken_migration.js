const BatToken = artifacts.require("BatToken");

module.exports = function(deployer)
{
    deployer.deploy(BatToken,1000000);
}