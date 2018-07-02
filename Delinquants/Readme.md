# The Division : Battle for Paris

This project was done by a team of people from Startups ,Banks and Public company at the Ubisoft hackathon of July 2018. It is a Blockchain based game that  innovate the way people are interacting with the players .
It is based on an Ethereum permittioned network firstly and then on public network where the advancement in term of privacy and scalability will be more mature.

# Testnet
    $ geth --testnet --rpc --rpcapi 'web3,eth,debug, personal, miner' --rpccorsdomain="*"

    $ geth --testnet attach http://localhost:8545
    $ geth --preload autoSetup.js --testnet attach http://localhost:8545                 

# Private
    $ geth --dev --rpc --rpcapi 'web3,eth,debug' --rpccorsdomain="*" --datadir /tmp/ethereum_dev_mode
    $ geth --dev --preload autoSetup.js  attach ipc:/tmp/ethereum_dev_mode/geth.ipc


# Check balance
    web3.fromWei(eth.getBalance(eth.accounts[0]), "ether") + " ether"


# deploy a contract
## timestamp as parameter
    /deployContract 212212121

## Useful links
To get started you can find an introduction to the language in the [Solidity documentation](https://solidity.readthedocs.org). In the documentation, you can find [code examples](https://solidity.readthedocs.io/en/latest/solidity-by-example.html) as well as [a reference](https://solidity.readthedocs.io/en/latest/solidity-in-depth.html) of the syntax and details on how to write smart contracts.

You can start using [Solidity in your browser](http://remix.ethereum.org) with no need to download or compile anything.

If you are interested in our research concerning the exchanges on Skins [here](https://github.com/omisego/plasma-cash).

Solidity is still under development. So please do not hesitate and open an [issue in GitHub](https://github.com/ethereum/solidity/issues) if you encounter anything strange.

Feel free to post issues !!

We will add the support to exchange ERC20 <--> ERC721 
