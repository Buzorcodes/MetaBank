// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MetaBank {
    address public  owner;
    uint public bankBalance;
   
    mapping(address => uint256) public balanceOf;

    constructor() {
        owner = msg.sender;
      }

    function mintToken( uint256 _value) public {
        require(msg.sender == owner, "Only owner can call this function");
        balanceOf[msg.sender] += _value;
        bankBalance += _value;
    }

    function transferToken(address _receiver, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value, "low balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_receiver] += _value;
    }

    function burnToken(uint256 _value) public {
        require(balanceOf[msg.sender] >= _value, "low balance");
        balanceOf[msg.sender] -= _value;
        bankBalance -= _value;
    }


}
