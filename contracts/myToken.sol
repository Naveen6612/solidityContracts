// SPDX-License-Identifier: MIT

pragma solidity  >=0.7.0 <0.9.0;

contract MyToken {

    address public owner;
    uint public  totalSupply;
    mapping (address => uint)public balances;

    mapping (address => mapping (address => uint) ) allowances  ;

    constructor() {
        owner = msg.sender;
    }

    modifier  onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // mint
    function mint(uint _amount) public onlyOwner {
        balances[owner] += _amount;
        totalSupply += _amount;
    }

    //mintTo 
    function mintTo(address to, uint _amount) public onlyOwner {
        balances[to] += _amount;
        totalSupply += _amount;
    }

    //transfer 
    function transfer(address to, uint amount) public {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[to] += amount;
        
    }
    //approve
    function approve(address to , uint value ) public returns (bool success) {
        allowances[msg.sender][to] = value;
        return true;
    }

    //allowance
    function allowance(address to, address from, uint value) public {
        require(allowances[msg.sender][from] >= value);
        require(balances[from] >= value);
        balances[from] -= value;
        balances[to] += value;
        allowances[from][msg.sender] -= value;

    }

}