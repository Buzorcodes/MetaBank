
# MetaToken

**MetaToken** is a simple Ethereum-based smart contract written in Solidity that implements a basic ERC-20 token. This contract allows you to create and manage your own cryptocurrency token on the Ethereum blockchain.

## Features

-   **Name**: Meta Token
-   **Symbol**: MTT
-   **Decimals**: 18
-   **Total Supply**: Initially, the total supply is set to 0, and tokens can be minted by the contract owner.

## Getting Started

These instructions will help you understand how to deploy and use the MetaToken contract on the Ethereum blockchain.

### Prerequisites

-   An Ethereum wallet (e.g., MetaMask)
-   Access to an Ethereum development environment (e.g., Remix or Truffle)

### Deployment

1.  Deploy the `MetaToken.sol` smart contract on the Ethereum network of your choice. Make sure to set the appropriate compiler version (0.8.18 or later) when deploying.
    
2.  After deployment, the owner of the contract will be set to the address that deployed it.
    
3.  You can configure the name, symbol, and decimals of your token by modifying the constructor function in the contract before deployment.
    

### Interacting with the Contract

Once the contract is deployed, you can interact with it using Ethereum wallets or by developing applications that make use of the MetaToken functions.

#### Minting Tokens

Only the contract owner can mint new tokens. To mint tokens, call the `mint` function with the desired amount as an argument. For example:

`function mint(uint256 _amount) public {
    require(msg.sender == owner, "Only owner");
    balances[msg.sender] += _amount;
    totalSupply += _amount;
}` 

#### Transferring Tokens

Users can transfer tokens to others by calling the `transfer` function. Ensure you have a sufficient balance to transfer tokens, or the transaction will fail. For example:



`function transfer(address _to, uint256 _amount) public {
    require(balances[msg.sender] >= _amount, "Insufficient fund");
    balances[msg.sender] -= _amount;
    balances[_to] += _amount;
}` 

#### Burning Tokens

Users can burn (destroy) their own tokens by calling the `burn` function. Make sure you have enough tokens to burn, or the transaction will fail. For example:


`function burn(uint256 _amount) public {
    require(balances[msg.sender] >= _amount, "Insufficient fund");
    balances[msg.sender] -= _amount;
    totalSupply -= _amount;
}` 

## License

This project is licensed under the MIT License. You can find the full license text in the SPDX-License-Identifier comment at the beginning of the contract.
