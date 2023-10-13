const main = async () => {
    const { ethers, deployments } = require("hardhat");
    const [deployer] = await ethers.getSigners();
    const provider = deployer.provider; // Get the provider from the signer
  
    const accountBalance = await provider.getBalance(deployer.address);
  
    console.log("Deploying contracts with account: ", deployer.address);
    console.log("Account balance: ", accountBalance.toString(), "ETH");
  
    
    const waveContractFactory = await hre.ethers.getContractFactory("Stake");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.waitForDeployment();

    console.log("Stake address: ", waveContract.address);
    
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();

//   0x32f7cA438ab2590971E15211E910b0BD1AEfDb27