// Get funds from users
// withdraw funds
// set a minimum funding value in usd

// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract FundMe {

    // uint256 public myValue = 1;
    uint256 public minimumUsd = 5;

    function fund() public payable{
        // allow to send $
        // have a minimum amount

        // this is cool for explaining over each transaction FIELDS, with its VALUE TRANSFERS (gas, to, data), FUNCTION CALL (can specify wei in fields)
        // what is a revert? undo any transaction done bacuase next one failed, and send remainging gas back
        // myValue = myValue +2; 

        // how to send eth to this contract?
        require(msg.value >= minimumUsd, "didn't send enough eth"); // 1e18 = 1 eth = 1 * 10 ** 18 = valuew in wei

        // https breaks conscensus
        // with chainlink networks because of oracle problem



    }

    // function withdraw() public {
    
    // }
}