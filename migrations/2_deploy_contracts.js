var ONUSToken = artifacts.require("ONUSToken")

module.exports = async (deployer) => {
    await deployer.deploy(ONUSToken)
    const token = await ONUSToken.deployed()
}
