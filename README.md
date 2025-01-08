# XenniumToken Smart Contract

This is a Solidity-based ERC20 token contract named **XenniumToken** (`XENX`). The contract implements the ERC20 token standard, along with additional features such as a **community reserve** and **development reserve**. It also includes a **Last Coin Transfer Restriction (LCTR)**, which ensures that users cannot spend their last coin.

## Features

- **Total Supply**: 19 billion tokens (`19,000,000,000 XENX`).
- **Community Reserve**: 3 billion tokens (`3,000,000,000 XENX`) are reserved for the community.
- **Development Reserve**: 1 billion tokens (`1,000,000,000 XENX`) are reserved for development purposes.
- **Last Coin Transfer Restriction (LCTR)**: Prevents users from spending their last coin.
- **ERC20 Token Standard**: Fully compatible with ERC20, allowing for token transfers and interactions with other ERC20-based systems.
- **ERC20Permit**: Supports gasless approvals using the `permit` function (allowing users to approve transactions without needing to pay gas fees).
- **Ownable**: The contract owner has special privileges, such as transferring the development reserve.

## Contract Overview

The contract is built using the following OpenZeppelin contracts:
- **ERC20**: Standard implementation of the ERC20 token.
- **Ownable**: Provides basic authorization control functions, simplifying the implementation of user permissions.
- **ERC20Permit**: Allows gasless token approvals using the `permit` function.

### Token Distribution
- **Total Supply**: `19,000,000,000 XENX`
- **Community Reserve**: `3,000,000,000 XENX`
- **Development Reserve**: `1,000,000,000 XENX`

When the contract is deployed, the total supply is minted to the contract's address, and the development reserve is transferred to the owner's wallet.

### Last Coin Transfer Restriction (LCTR)
To ensure that users cannot accidentally transfer their last token, the contract implements a check in the `transfer` and `transferFrom` functions. The `_safeTransferCheck` function ensures that the sender will always have at least one token remaining after a transfer.

## Functions

### `communityReserve()`
Returns the amount of tokens reserved for the community. This is a view-only function.
