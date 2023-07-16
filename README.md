# RishiToken
RishiToken is a simple ERC20 token contract written in Solidity. It allows the contract owner to mint tokens, and users can burn and transfer tokens. Simply it allows the user to create and control their own tokens.

## Description
This code represents a Solidity smart contract called "RishiToken." It is an ERC-20 compatible token contract that allows for the creation or minting of tokens to a particular address, transfer tokens from sender to receiver, and burning (destruction) of tokens from some address. In this contract the mint function is accessed only by the owner but other two functions i.e. burn and transfer are accessed by anyone. 

## Installation
For running this contract you should follow these steps:
1. Install project dependencies.

   `npm install`

2. Start blockchain locally.

   `npx hardhat node`

3. Deploy the contract.

   `npx hardhat run scripts/deploy.js --network localhost`

## Execution

  - Go to `Remix` and paste you solidity code there and compile it.
  - Now go to environment in deploy tab and select `dev - hardhat provider`.
  - Copy your contract address from the terminal of vs-code and paste it in the `At Address` section in deploy tab and run it.
  - Now you can interact with your contract.

# Features
  - `mint` = This function mints new tokens and assigns them to the specified address. It takes the recipient's address and token amount in parameters and caller must be the owner to access this function.
  - `burn` = This function burns the specified amount of tokens from the caller's balance. It takes the amount of token in parameter and anyone can use this function.
  - `transfer` = This function transfers the specified amount of tokens from the caller's balance to the specified address. It takes sender and reciever addresses and also token amount in parameters.

## License
This contract is released under the MIT License.
