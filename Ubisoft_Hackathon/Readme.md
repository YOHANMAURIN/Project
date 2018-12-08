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

If you are interested in our research concerning the exchanges on Skins [here](https://github.com/loomnetwork/transfer-gateway-example).

Solidity is still under development. So please do not hesitate and open an [issue in GitHub](https://github.com/ethereum/solidity/issues) if you encounter anything strange.

Feel free to post issues !!

## Improvement

Make a system of metadata more or less rare in the ERC721 token, with the same matters than crytokitties. Then add in the SC exchange a pseudo-random system which takes into consideration the number of gems exchanged, which would have more or less rare metadata.

Find a system that allows you no longer need to manually allocate the right to the contract to spend our funds.


## Explanation contract

ERC721 stuff --> Each token is unique and represents a character's stuff (armor, knife, weapon, knee pad etc.)

ERC20 gemmes --> Currency of the game which is obtained only by playing (impossible to buy for money)

ERC20 skin --> Currency that allows to buy skins that can customize the appearance of the player but does not improve its performance.

Vote --> System of voting within a faction (i.e clan) for decisions taken within the faction (proposal of person to exlure, confrontation faction enemy, etc ...)

Exchange --> Lets you trade x gemmes (x tokens ERC20) for one stuff (1 token ERC721)

Distribut gemmes --> SC linked to a html page (use of web3) to reward a person at a certain location. As part of this project, it is imagined that there will be a contract deployed by place where we can find gems. Futhermore, it is necessary to put gems (tokens) in the contract to receive then a reward, moreover only the honor of the SC can interact with. It is therefore used for transparency.



### Exchange SC :
<br> ATTENTION: Before executing the Swap function use the approve function of the Gems Contract(0xe02005819E60b16E3eBaa040df7d3394AF9AC12e), allocate a portion of your funds to this contract. (Any help is welcome to not need to do this)</br>
Because if we put this "Gemmes(0xe02..).approve(contract_address,value_gemmes);" in swap function this will not allow the contract to spend your tokens.

Note: In place of burn tokens, it may also be possible to send them to a central entity such as Ubisoft.
