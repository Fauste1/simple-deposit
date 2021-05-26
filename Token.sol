pragma solidity ^0.8.0;

contract TestToken {
    mapping(address => uint256) public balances;
    // uint256 public totalSupply = 1000;
    
    constructor() {
        balances[msg.sender] = 1000;
    }
    
    function transfer(address recipient, uint256 amount) public returns(bool success) {
        require(balances[msg.sender] >= amount, "Insufficient funds for transfer");
        
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        
        return(true);
    }
}