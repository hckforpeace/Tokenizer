# Smart Contract Deployment Guide

This guide explains how to deploy the smart contract located in the `code/` directory of this repository using **Remix** and **MetaMask**.

## Prerequisites

- [MetaMask](https://metamask.io/) browser extension installed.
- A MetaMask account with test ETH on the **Sepolia** test network.
- Modern web browser to access [Remix IDE](https://remix.ethereum.org/).

## Steps to Deploy

1. **Set up MetaMask**
   - Open MetaMask and create a new account or use an existing one.
   - Switch the network to **Sepolia Test Network**.
   - Ensure your account has some Sepolia test ETH (you can get some from a Sepolia faucet).

2. **Open Remix IDE**
   - Go to [Remix IDE](https://remix.ethereum.org/) in your web browser.
   - In the left sidebar, create a new file inside the `scripts` folder and paste the contents of your Solidity contract from `code/<your_contract>.sol`.

3. **Compile the Contract**
   - Click the **Solidity Compiler** tab on the left sidebar.
   - Select the appropriate compiler version matching your contract.
   - Click **Compile**.

4. **Deploy the Contract**
   - Go to the **Deploy & Run Transactions** tab.
   - Under **Environment**, select **Injected Provider - MetaMask**.
   - MetaMask will ask you to connect; select the account you want to use.
   - Under **Contract**, select the correct contract you want to deploy from the dropdown.
   - Click **Deploy** and confirm the transaction in MetaMask.

5. **Done**
   - After a few seconds, your contract will be deployed on the Sepolia test network.
   - You can interact with it directly through Remix or via the contract address in MetaMask.

---

Feel free to reach out if you encounter any issues during deployment.

