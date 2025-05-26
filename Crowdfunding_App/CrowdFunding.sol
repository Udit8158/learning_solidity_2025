// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract CrowdFunding {
    // state variables
    string public name_of_campaign;
    string public description_of_campaign;
    uint256 public goal_amount;
    uint256 public deadline_of_campaign;
    address public owner;
    Tier[] public tiers;

    // Define tier for deposit funds
    struct Tier {
        string name;
        uint256 amount;
        uint256 backers;
    }

    // setting state variables while creating (deploying) the contract
    constructor(
        string memory _name, 
        string memory _description ,
        uint256 _goalAmount,
        uint _durationInDays
    ) {
        name_of_campaign = _name;
        description_of_campaign = _description;
        goal_amount = _goalAmount;
        deadline_of_campaign = block.timestamp + (_durationInDays * 1 days);
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Owners only");
        _;
    }

    // Functions

    // write function - modify blockchain data
    function deposit(uint256 _tierIndex) public payable {
        uint256 balance = getBalance();
        // some requirements
        require(_tierIndex < tiers.length, "Invalid tier");
        require(msg.value == tiers[_tierIndex].amount, "Invalid amount for the tier");
        require(block.timestamp < deadline_of_campaign, "Campaign is closed");
        require(balance <= goal_amount, "Goal has been reached");

        tiers[_tierIndex].backers++; // increase the backers in the specific tier
    }

    // write function - modify blockchain data
    function withdraw() public onlyOwner{
        uint256 balance = getBalance();
        // requirements
        require (balance >= goal_amount, "Goal hasn't been reached");
        require (balance > 0, "Zero balance can't be withdrawn");

        // so this will only execute if above requirements are full-filed.
        payable(owner).transfer(balance); // now transfer the balance
    }
    
    // read function - read blockchain data
    function getBalance() public view returns (uint256){
        return address(this).balance; // return the balance of the contract
    }

    // write fuction - to add and remove tiers (only owner can do)

    function addTier(
        string memory _name, 
        uint256 _amount
    ) public onlyOwner {
        // requirements
        require(_amount > 0, "Amount must be greater than 0");
        require(bytes(_name).length > 0, "Provide a name for new tier");
        tiers.push(Tier(_name, _amount, 0));
    }

    function removeTier(
        uint256 _index
    ) public onlyOwner {
        require (_index < tiers.length , "Tier doesn't exist");
        tiers[_index] = tiers[tiers.length -1]; 
        tiers.pop();
    }


} 