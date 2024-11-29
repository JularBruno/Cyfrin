// Get funds from users
// withdraw funds
// set a minimum funding value in usd

// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    // uint256 public myValue = 1;
    uint256 public minimumUsd = 1e18;

    function fund() public payable{
        // allow to send $
        // have a minimum amount

        // this is cool for explaining over each transaction FIELDS, with its VALUE TRANSFERS (gas, to, data), FUNCTION CALL (can specify wei in fields)
        // what is a revert? undo any transaction done bacuase next one failed, and send remainging gas back
        // myValue = myValue +2; 

        // how to send eth to this contract?
        // require(msg.value >= minimumUsd, "didn't send enough eth"); // 1e18 = 1 eth = 1 * 10 ** 18 = valuew in wei
        require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough eth");

        // https breaks conscensus
        // with chainlink networks because of oracle problem

        // msg.value 18 decimal places because of Wei
    }

    // function withdraw() public {}

    function getPrice() public view returns (uint256){
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306 // eth usd sepolia
        // ABI list of functions of a contract
        // bboth things are required for this 

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // prettier-ignore
        (, int256 answer, , , )  = priceFeed.latestRoundData(); // int because values can be negative
        // uint80 roundID, ,uint startedAt ,uint timeStamp ,uint80 answeredInRound

        return uint256(answer * 1e10); // decimal places from eth to usd
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        // 1 ETH?
        // 2000_0000000000000000000
        uint256 ethPrice = getPrice();
        // 1 / 2 = 0
        // 2000_0000000000000000000 * 1_000000000000000000) / 1e18
        // $2000 = 1 ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}