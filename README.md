# Shadow Horizon (Built for Base)

Deployed on Base Mainnet.

Shadow Horizon is a read-only Base inspection workspace designed to validate network identity and run probes for balances, nonces, and blocks using official Base RPC endpoints and Coinbase Wallet SDK.

---

## Why this repository?

This project exists to offer an easily extensible and transparent tool for verifying Base network identity, inspecting public data, and testing out read-only queries. It focuses on:
- Confirming chainId values for Base networks (8453 / 84532)
- Inspecting balances, transaction counts, and blocks
- Providing direct links to Basescan for independent validation

---

## Repository layout

- app/shadow-horizon.ts  
  Browser-based script that establishes wallet connection and performs read-only RPC queries.

- config/base.networks.json  
  Static configuration for Base networks (chainIds, RPC URLs, explorers).

- docs/architecture.md  
  High-level architectural notes about the design and intent of the project.

- contracts/  
  Solidity contracts deployed to Base Sepolia for testnet validation:
  - SimpleVault.sol — A basic vault contract that allows users to deposit and withdraw funds, with an owner who can withdraw all funds.  
  - UserProfileStore.sol — A contract that allows users to store and update a simple user profile (name, age).  

- package.json  
  Dependency manifest referencing Coinbase SDKs and multiple Base and Coinbase repositories.

- README.md  
  Primary technical documentation for the project.

---

## Capabilities overview

- Coinbase Wallet connection (EIP-1193)  
- Validation of Base Mainnet and Base Sepolia chainIds (8453 / 84532)  
- Network snapshot (block height, timestamp, gas price, etc.)  
- Address probe (balance, transaction count, bytecode presence)  
- ERC-20 token inspection (name, symbol, supply, balance)  
- Independent verification via Basescan links  

No transactions are signed or broadcast.

---

## Base network context

Base Mainnet  
chainId (decimal): 8453  
Explorer: https://basescan.org  

Base Sepolia  
chainId (decimal): 84532  
Explorer: https://sepolia.basescan.org  

---

## Tooling and dependencies

This repository integrates tooling from the Base and Coinbase ecosystems:
- Coinbase Wallet SDK for wallet access  
- OnchainKit for Base-native primitives  
- viem for efficient, typed RPC interaction  
- Several Base and Coinbase repositories included as dependencies  

---

## License

MIT License

Copyright (c) 2025 sob-bedpost0q

---

## Author

GitHub: https://github.com/sob-bedpost0q  
Email: sob_bedpost0q@icloud.com  
Public contact: https://x.com/zaghmadaring  

---

## Testnet Deployment (Base Sepolia)

As part of pre-production validation, one or more contracts may be deployed to the Base Sepolia test network to confirm correct behavior and tooling compatibility.

Network: Base Sepolia  
chainId (decimal): 84532  
Explorer: https://sepolia.basescan.org  

Contract #1 address:  
0xE9A0F1B2C8D2B3F4E5A8F0A9F7D5A3B6C7D2E4A8

Deployment and verification:
- https://sepolia.basescan.org/address/0xE9A0F1B2C8D2B3F4E5A8F0A9F7D5A3B6C7D2E4A8
- https://sepolia.basescan.org/0xE9A0F1B2C8D2B3F4E5A8F0A9F7D5A3B6C7D2E4A8/0#code  

Contract #2 address:  
0x8B2C3D0E5A1B9F4C8D2B5C9D7A6E4A0F9E5C7A2B

Deployment and verification:
- https://sepolia.basescan.org/address/0x8B2C3D0E5A1B9F4C8D2B5C9D7A6E4A0F9E5C7A2B
- https://sepolia.basescan.org/0x8B2C3D0E5A1B9F4C8D2B5C9D7A6E4A0F9E5C7A2B/0#code  


These testnet deployments provide a controlled environment for validating Base tooling, account abstraction flows, and read-only onchain interactions prior to Base Mainnet usage.
