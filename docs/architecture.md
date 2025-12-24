# Shadow Horizon — Architecture Overview

This document provides a high-level overview of the project structure, Base alignment, and key design decisions.

---

## Base Alignment

The **Shadow Horizon** project is built on **Base** and supports **Base Mainnet** and **Base Sepolia**.

- **Base Mainnet** (`chainId: 8453`) is used for production environments.
- **Base Sepolia** (`chainId: 84532`) is used for testnet interactions.
- All RPC endpoints and explorer URLs are derived from a central configuration file, `config/base.networks.json`.
- Hardcoded RPC URLs or Chain IDs should be avoided to ensure the application is dynamic and easy to adapt to future changes in Base infrastructure.

---

## Read-only Model

Shadow Horizon adopts a **read-only** approach:

- The contract interacts with Base networks for **querying** balances, retrieving metadata, and exploring the state of the blockchain.
- **No transactional writes** are performed by the core logic, keeping the validation and inspection process deterministic.
- This approach also ensures a simpler testing and verification process, where only **view functions** and **getter functions** are utilized.

---

## Project Structure

The repository is structured as follows:
- **`config/`**: Holds static configuration files for network definitions.
- **`scripts/`**: Contains helpers for testnet validation, probes, and interactions with Base networks.
- **`docs/`**: Includes operational and technical documentation, such as this architecture overview and runbooks.
- **`src/`**: Where core contract code (and other business logic) lives.

---

## Design Decisions

1. **Centralized Network Configuration**:  
   By storing network metadata (e.g., RPC URLs, explorers) in a configuration file, we ensure that any changes to network endpoints are centralized and easily maintainable.

2. **Minimized Dependencies**:  
   We avoid using unnecessary dependencies to reduce the attack surface and ensure that our application remains lean and fast.

3. **EVM Compatibility**:  
   Since Base is an EVM-based layer, all contracts are written in Solidity, and we take advantage of existing EVM tooling (e.g., `ethers.js` for network interactions).

4. **Error Handling**:  
   Since we’re targeting Base networks, robust error handling is required to gracefully manage situations where an RPC call fails, or an explorer is down.

---

## Future Considerations

- **Support for Other Base Networks**:  
   In the future, we could support additional Base networks once they are released or become more widely used.

- **Transaction Simulation**:  
   Although the current scope is read-only, we could consider adding the ability to simulate transactions in the future if needed.

_Last updated: initial scaffold_
