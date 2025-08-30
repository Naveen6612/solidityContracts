// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26 ;


contract Payble {
    uint  willTime;
    uint startTime;
    uint public lastVisited;
    address payable  recipient;
    address owner; 

    constructor(address payable _recipient) {
            
            willTime = 10;
            startTime = block.timestamp;
            lastVisited = block.timestamp;
            owner = msg.sender;
            recipient = _recipient;
    }
    modifier onlyOwner() {
            require(msg.sender == owner);
            _;
    }
    modifier  onlyRecipient() {
        require(msg.sender == recipient);
        _;
    }

    function deposite() public payable onlyOwner {
        lastVisited = block.timestamp;
    }

    function claim() external  onlyRecipient {
        require(lastVisited < block.timestamp - willTime);
        payable (recipient).transfer(address(this).balance);
    } 
}