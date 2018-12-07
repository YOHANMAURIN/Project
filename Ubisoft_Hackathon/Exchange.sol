Contract address : https://ropsten.etherscan.io/address/0xcb202c67043614ac0e5191d40df64b7485d346c5

pragma solidity ^0.4.21;

import "./Gemmes.sol"; 
import "./ERC721Token.sol";

contract Exchange {

uint256 Token_id = 0;

/**
 *  Before executing the Swap function use the approve function of the Gems Contract (0xe02005819E60b16E3eBaa040df7d3394AF9AC12e), allocate a portion of your funds to this contract.
 *  Convert x ERC20 against 1 ERC71
 */
function Swap (uint256 valueERC20) public {
    Gemmes(0xe02005819E60b16E3eBaa040df7d3394AF9AC12e).burnFrom(msg.sender,valueERC20);
    ERC721Token(0x53ffb614D35cCB4E8e6E7Bd78AdEB4eD10d5eE36)._mint(msg.sender, Token_id);
    Token_id=Token_id + 1;
    }
}
