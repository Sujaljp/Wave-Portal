// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Stake {

    constructor() {
        console.log("Staking smart contract implemented");
    }
    
    mapping(address => uint256) public userDeposits;
    
    mapping(address => uint256) public withdrawalTimestamps;

    uint256 public lockingPeriod = 1 days;

    function deposit() external payable {
        require(msg.value >= 59 ether, "You must deposit exactly 60 ethers");

        userDeposits[msg.sender] += msg.value;
        
    }

    function withdraw() external {
        require(withdrawalTimestamps[msg.sender] == 0, "You have already withdrawn");

        require(block.timestamp >= withdrawalTimestamps[msg.sender] + lockingPeriod, "Locking period not over yet");

        uint256 amountToWithdraw = userDeposits[msg.sender];

        require(amountToWithdraw > 0, "No balance to withdraw");

        withdrawalTimestamps[msg.sender] = block.timestamp;

        payable(msg.sender).transfer(amountToWithdraw);
    }

    //project listing segment
    struct Project{
        uint256 id;
        string name;
        string sector;
        string city;
        string entBack;
        uint256 noCity;
        uint256 marketSize;
        // uint256 salesYear;
        // uint256 salesMonth;
        // uint256 salesMonthP;
        // uint256 salesFuture;
        // uint256 profit;
        // uint256 ebidta;
        // uint256 grossMargin;
        // uint256 amountAsk;
        // uint256 offeredEquity;
        // uint256 valuation;
        address _address;
        string stage;
    }

    event ProjectCreate (
        uint256 id,
        string name,
        string sector,
        string city,
        string entBack,
        uint256 noCity,
        uint256 marketSize,
        
        address _address,
        string stage
    );

    // uint256 salesYear,
    //     uint256 salesMonth,
    //     uint256 salesMonthP,
    //     uint256 salesFuture,
    //     uint256 profit,
    //     uint256 ebidta,
    //     uint256 grossMargin,
    //     uint256 amountAsk,
    //     uint256 offeredEquity,
    //     uint256 valuation,

    mapping(address => Project) public projects;
    Project[] public allProjects;

    function listProject(
        uint256 id,
        string memory name,
        string memory sector,
        string memory city,
        string memory entBack,
        uint256 noCity,
        uint256 marketSize,
        // uint256 salesYear,
        // uint256 salesMonth,
        // uint256 salesMonthP,
        // uint256 salesFuture,
        // uint256 profit,
        // uint256 ebidta,
        // uint256 grossMargin,
        // uint256 amountAsk,
        // uint256 offeredEquity,
        // uint256 valuation,
        string memory stage
    ) public {
        projects[msg.sender] = Project(id,name,sector,city,entBack,noCity,marketSize,
        // salesYear,salesMonth,salesMonthP,salesFuture,profit,ebidta,grossMargin,amountAsk,offeredEquity,valuation,
        msg.sender,stage);

        allProjects.push(projects[msg.sender]);

        emit ProjectCreate(id, name, sector, city, entBack, noCity, marketSize,
        //  salesYear, salesMonth, salesMonthP, salesFuture, profit, ebidta, grossMargin, amountAsk, offeredEquity, valuation, 
         msg.sender, stage);
    }

    function getAllProject() public view returns (Project[] memory){
        return allProjects;
    }

    function getProject(address _address) public view returns (Project memory){
        return projects[_address];
    }


}


//npx hardhat node
//npx hardhat run scripts/deploy.js --network localhost