var FEDToken = artifacts.require("FEDToken");

module.exports = function(deployer) {
  deployer.deploy(FEDToken);
};