require("@nomicfoundation/hardhat-toolbox");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
      console.log(account.address);
  }
});

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  settings: {
    optimizer: {
      enabled: true,
      runs: 100,
    },
    viaIR: true,
  },
  networks: {
    goerli: {
      url: "https://silent-attentive-haze.ethereum-goerli.discover.quiknode.pro/a533f5c3c47a2e0c772126f9987cb574c47b5b4f/",
      accounts: ["e2af472d934c915fc74ff862e4fec38dacf575c6e8c681131956488f4e81fad7"]
    },
  },
};


