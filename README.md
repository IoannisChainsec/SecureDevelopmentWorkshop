# ETHCC2022WorkshopFoundry

## Alchemy

Create an API key for Alchemy by creating a new app.

## Docker

``docker pull ghcr.io/foundry-rs/foundry:latest``

``docker run --rm -v $PWD:/shared/ -it --entrypoint /bin/sh ghcr.io/foundry-rs/foundry``

## Foundry Cheatsheet

* ``vm.prank(address)``: execute the next call as an arbitrary address
* ``vm.startPrank(address)``
* ``vm.stopPrank()``

### Fuzzing

* ``vm.assume(bool)``

### Mainnet fork

* ``forge test --fork-url https://eth-mainnet.alchemyapi.io/v2/<API> -vvvvv --match <test_name>``

