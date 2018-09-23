var UniversalRewardProtocolToken = artifacts.require("./UniversalRewardProtocolToken.sol");


module.exports = function(deployer) {
  deployer.deploy(UniversalRewardProtocolToken);
};
