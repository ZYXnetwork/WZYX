const WZYX = artifacts.require("WZYX");

const {deployProxy, upgradeProxy} = require('@openzeppelin/truffle-upgrades');

module.exports = async function (deployer) {
  await deployProxy(WZYX, [], { deployer, initializer: 'initialize' });
};

// module.exports = async function (deployer) {
//   const existing = await WZYX.deployed();
//   const instance = await upgradeProxy(existing.address, WZYX, {deployer});
//   console.log("Upgraded", instance.address);
// }