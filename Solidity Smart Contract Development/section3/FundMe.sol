// Get funds from users
// withdraw funds
// set a minimum funding value in usd

// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; // interfaces are for interact with ABI contract without actual functions in it

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256; // FOR LIBRARY PriceConverter, since it can be called directly on uint256

    // uint256 public myValue = 1; // this is used to explain revert
    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded; // map senders and the sent value

    function fund() public payable{
        // allow to send $
        // have a minimum amount

        // this is cool for explaining over each transaction FIELDS, with its VALUE TRANSFERS (gas, to, data), FUNCTION CALL (can specify wei in fields)
        // what is a revert? undo any transaction done bacuase next one failed, and send remainging gas back
        // myValue = myValue +2; 

        // how to send eth to this contract?
        // require(msg.value >= minimumUsd, "didn't send enough eth"); // 1e18 = 1 eth = 1 * 10 ** 18 = valuew in wei (** means raised)
        
        // require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough eth"); // require is kind of trycatch

        // here is the version where a library is used. Can have parameters but msg.value will be always the first parameter
        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough eth"); 

        // https breaks conscensus
        // with chainlink networks because of oracle problem

        // msg.value 18 decimal places because of Wei

        funders.push(msg.sender); // another global variable that can be called in solidity for getting the sender, can be seen in docs
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function withdraw() public {}

}