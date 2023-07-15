const { ethers } = require("hardhat");

async function main() {

  const RishiToken = await hre.ethers.getContractFactory("RishiToken");
  const [token_deploy] = await ethers.getSigners();
  console.log("Contract is getting deploy with this account: ", token_deploy.address);
  const rishi_token = await RishiToken.deploy(
    "Rishi", //token name
    "Rup", //token symbol
    ethers.parseEther("500") //passing ethers
  );
  console.log("The token is deployed to:", rishi_token.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
