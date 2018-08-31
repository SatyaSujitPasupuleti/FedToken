var fedtoken = artifacts.require("./fedtoken");

module.exports = function(deployer) {
  deployer.deploy(fedtoken);
};