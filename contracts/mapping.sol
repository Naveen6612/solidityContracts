// SPDX-License-Identifier: MIT

pragma solidity  >=0.7.0 <0.9.0;

contract Mapping {

    mapping (address => string) public names;

    constructor () {

    }
    function setName(string memory _name) public {
        names[msg.sender] = _name;
    }

    function getName(address _address) public view returns ( string memory) {

    return names[_address];
    }
}