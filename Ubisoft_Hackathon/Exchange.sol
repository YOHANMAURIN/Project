Contract Address : https://ropsten.etherscan.io/token/0x722f49a5460a934f0c7af7b35a15ccc8b3a6bf99

pragma solidity ^0.4.21;

import "./ERC20Gemmes.sol"; 
import "./ERC721Stuff.sol";

contract Exchange is ERC721Token {

uint256 Token_id = 0;

/**
 *  Before executing the Swap function use the approve function of the Gems Contract (0xe02005819E60b16E3eBaa040df7d3394AF9AC12e), allocate a portion of your funds to this contract.
 *  Convert x ERC20 against 1 ERC71
 */
function Swap (uint256 valueERC20) public {
    Gemmes(0xe02005819E60b16E3eBaa040df7d3394AF9AC12e).burnFrom(msg.sender,valueERC20);
    ERC721Token._mint(msg.sender, Token_id);
    Token_id=Token_id + 1;
    }
}
