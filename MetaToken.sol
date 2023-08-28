// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MetaToken {
    address public  owner;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        name = "Meta Token";
        symbol = "MTT";
        decimals = 18;

    }

    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient fund");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    function burn(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient fund");
        balances[msg.sender] -= _amount;
        totalSupply -= _amount;
    }

    function mint( uint256 _amount) public {
        require(msg.sender == owner, "Only owner");
        balances[msg.sender] += _amount;
        totalSupply += _amount;
    }
}
