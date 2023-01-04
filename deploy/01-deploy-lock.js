module.exports = async (hre) => {
    const { getNamedAccounts, deployments } = hre
    console.log(getNamedAccounts())
}