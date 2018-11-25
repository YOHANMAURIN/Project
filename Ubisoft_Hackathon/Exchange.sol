pragma solidity ^0.4.24;

import "./Gemme.sol"; 
import "./Stuff.sol";

contract Exchange is Gemmes,ERC721Token {
    
uint256 distributed_token721;

function Exchanger(address token20_addr, address token721_addr) public {
    platform = msg.sender;
    token721 = BasicToken.balanceOf(token721_addr); //address stuff 0xc53ed6af8b2db78b3f3fc5dd05832cb351101da5
    token20 = Gemmes(token20_addr); //address gemmes 0xd4008faedb116c166eace4cdf4cbb7853df7c519
    distributed_token721 = 0;
}

/*
 * @_value: the value specific as ERC20 token
 * @return: numbers of token specific as ERC721 asset
 */
function transfer(uint256 _value) public {
    address _from = msg.sender;
    address _to = platform;
    StandardToken.transferFrom(_from, _to, _value);
    // DEV: one ERC20 token can exchange to 1 ERC721 asset
    uint256 i = distributed_token721;
    uint16 factor = 1;
    for (; i < distributed_token721 + _value * factor; i ++) { //voir boucle for solidity pas sur du tout !!
        ERC721Basic.transferFrom(_to, _from, i);
    }
    distributed_token721 = i;
}

//convert x ERC20 against 1 ERC71
//Est ce que c'est mieux de burn les tokens à chaque fois (décentralisé) ou de les envoyer à une address conrrespondant à l'émetteur du jeu
function Swap (uint256 valueERC20) public {
    stuff = ERC721Token(0xc53ed6af8b2db78b3f3fc5dd05832cb351101da5);
    gemmes = Gemmes(0xD4008fAEdb116C166EacE4cDf4CBb7853df7C519);
    gemmes.burn(valueERC20);
    tokenId= //mettre un nombre pseudo aléatoire qui provient de la conversion du hash du dernier bloc trouvé en nombre
    if (stuff.tokenURI(tokenId) != ""){ //token URI renvoie l'URI grâce à l'id du token si la fonction renvoie une chaine de 
					//caractère vide cela veut dire que l'id n'existe pas
	//mettre un autre id

    stuff._mint(msg.sender, tokenId);
    
}
