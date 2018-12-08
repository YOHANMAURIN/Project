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
<br>ERC721 stuff --> élément unique qui représente un stuff d'un personnage (armure, couteau, arme, genouillère etc..)</br>
<br>ERC20 gemmes --> monnaie du jeu qui s'obtient uniquement en jouant (impossible d'en acheter contre de l'argent)</br>
<br>ERC20 skin --> élément uniquement utilisé pour l'apparence du joueur mais qui ne permet pas d'améliorer ses performances. Est ce que un skin est unique ? pq pas un 721 ?</br>
<br>Vote --> système de vote au sein d'une faction (i.e clan) pour des décisions prisent au sein du clan (proposition de personne à exlure, affrontement faction ennemie, etc...)</br>
<br>Exchange --> permet de swap x gemmes (x tokens ERC20) contre du stuff (1 token ERC721)</br>
<br>Distribut gemmes --> SC lié à une page html (utilisation de web3) pour pourvoir rewarder une personne se trouvant à une certaine localisation. Dans le cadre de ce projet il est imaginé qu'il y aura un contrat déployé par lieu où l'on peut trouver des gemmes. De plus il faut mettre des gemmes (des tokens) dans le contrat pour recevoir ensuite une reward, de plus seul le honnor du SC peut intéragir avec. Il sert donc à la transparence.</br>



Exchange SC :
<br> ATTENTION: Before executing the Swap function use the approve function of the Gems Contract(0xe02005819E60b16E3eBaa040df7d3394AF9AC12e), allocate a portion of your funds to this contract. (Any help is welcome to not need to do this)</br>
Because if we put this "Gemmes(0xe02..).approve(contract_address,value_gemmes);" in swap function this will not allow the contract to spend your tokens.

Note: In place of burn tokens, it may also be possible to send them to a central entity such as Ubisoft.
