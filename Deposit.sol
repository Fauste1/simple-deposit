pragma solidity ^0.8.0;

contract MyContract {
    mapping(address => uint256) public balanceOf;
    
    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
    }
    
    function contractBalance() external view returns(uint256 balance) {
        return address(this).balance;
    }
    
    function withdrawDeposit(address payable _recipient, uint256 _amount) external returns(bool success) {
        require(balanceOf[msg.sender] > _amount, "Not enough funds for withdrawal");
        balanceOf[msg.sender] -= _amount;
        (bool _success, ) = _recipient.call{ value: _amount }("");
        return _success;
    }
    
    function transferDeposit(address _recipient, uint256 _amount) external {
        require(balanceOf[msg.sender] > _amount, "Not enough funds for transfer");
        balanceOf[msg.sender] -= _amount;
        balanceOf[_recipient] += _amount;
    }
}