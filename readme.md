# Solidity Smart Contract Development 

Solidity Smart Contract Development is made and executed on
https://remix.ethereum.org/

# Foundry fundamentals 

Other courses and interests beside Cyfrin
https://speedrunethereum.com/challenge/simple-nft-example
https://docs.prylabs.network/docs/install/install-with-script


### For using foundry on windows:

- install wsl
- install remote connector in vs code
- use remote conector to access ubuntu wsl

mount windows folder:
```
cd /mnt/c/Users/YourUsername/Projects/Cyfrin/
```
#### deploy contract local onchain WITH ENV

forge script script/DeploySimpleStorage.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY

#### deploy contract local onchain WITH cast wallet list

- this after cast wallet import defaultkey --interactive
```
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --account defaultkey --broadcast -vvvv
```
### broadcast -> dry-run -> transaction

- stored transaction pieces
- gas quick calc: ```cast --to-base 0x71556 dec```
- nonce: data for rerun transaction

### how to setup cast wallet on dotenv

- Interact with a smart contract using the CLI
```
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "store(uint256)" 123 --rpc-url http://127.0.0.1:8545 --account defaultkey

cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "retrieve()"

cast --to-base 0x000000000000000000000000000000000000000000000000000000000000007b dec
```

### Deploying a smart contract on testnet (Sepolia)

- settedup cast wallet metamask on actual metamask wallet
```
forge script script/DeploySimpleStorage.s.sol --rpc-url https://eth-sepolia.g.alchemy.com/v2/9Yi86zPO8rSrihsldwaChOAm-MvfKaPf --account metamask --broadcast
```
https://sepolia.etherscan.io/tx/0xba0637fb5f5df170200bfae114db3b83644e0c52551502908d9d4d40f7894e10