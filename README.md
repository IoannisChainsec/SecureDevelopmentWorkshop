# Secure DeFi smart contract development on Ethereum

## Setup

### Alchemy

Create an API key for Alchemy by creating a new app.

### Docker or install Foundry

For Docker:

``docker pull ghcr.io/foundry-rs/foundry:latest``

``docker run --rm -v $PWD:/shared/ -it --entrypoint /bin/sh ghcr.io/foundry-rs/foundry``

For [Foundry](https://github.com/foundry-rs/foundry):

``curl -L https://foundry.paradigm.xyz | bash``

and then run ``foundryup``.

## Foundry Cheatsheet

* ``vm.prank(address)``: execute the next call as an arbitrary address
* ``vm.startPrank(address)``
* ``vm.stopPrank()``

### Fuzzing

* ``function foo(fuzzedValue)``
* ``vm.assume(bool)``

### Mainnet fork

* ``forge test --fork-url https://eth-mainnet.alchemyapi.io/v2/<API> -vvvvv --match <test_name>``
