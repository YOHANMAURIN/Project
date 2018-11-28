pragma solidity ^0.4.24;

import "./Gemme.sol"; 
import "./ERC721Token.sol";

contract Exchange is Gemmes,ERC721Token {

//convert x ERC20 against 1 ERC71
//Est ce que c'est mieux de burn les tokens à chaque fois (décentralisé) ou de les envoyer à une address conrrespondant à l'émetteur du jeu
function Swap (uint256 valueERC20) public {
    stuff = ERC721Token(0xc53ed6af8b2db78b3f3fc5dd05832cb351101da5);
    gemmes = Gemmes(0xD4008fAEdb116C166EacE4cDf4CBb7853df7C519);
    gemmes.burn(valueERC20);
    tokenId= uint(block.blockhash(block.number-1));//il n'est pas possible de générer un nombre aléatoire, on se base sur le hash du dernier bloc généré, converti en entier
    while (stuff.tokenURI(tokenId) != ""){ //token URI renvoie l'URI grâce à l'id du token si la fonction renvoie une chaine de 
				tokenId = tokenId + 1;	//caractère vide cela veut dire que l'id n'existe pas
	}

    stuff._mint(msg.sender, tokenId);
}
}
