const main = async () => {
    const [owner,randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.waitForDeployment();
    console.log("Contract deployed to:", waveContract.address);

    // console.log("Contract deployed by:",owner.address);
    
    // await waveContract.getTotalWaves();

    // const firstWaveTxn = await waveContract.wave();
    // await firstWaveTxn.wait();
  
    // await waveContract.getTotalWaves();
  
    // const secondWaveTxn = await waveContract.connect(one).wave();
    // await secondWaveTxn.wait();
  
    // await waveContract.getTotalWaves();

    let waveCount = await waveContract.getTotalWaves();
    console.log(waveCount);
    

  /**
   * Let's send a few waves!
   */
  let waveTxn = await waveContract.wave("A message!");
  await waveTxn.wait(); // Wait for the transaction to be mined

  waveTxn = await waveContract.connect(randomPerson).wave("Another message!");
  await waveTxn.wait(); // Wait for the transaction to be mined

  let allWaves = await waveContract.getAllWaves();
  console.log(allWaves);

  };


  
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0); // exit Node process without error
    } catch (error) {
      console.log(error);
      process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
    }
    // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
  };
  
  runMain();