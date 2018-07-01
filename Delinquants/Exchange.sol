pragma solidity ^0.4.24;

import "./Gemme.sol"; 
import "./Stuff.sol";

contract Exchange is Gemmes,ERC721Token {
    
uint256 distributed_token721;

function Exchanger(address token20_addr, address token721_addr) public {
    platform = msg.sender;
    token721 = BasicToken.balanceOf(token721_addr);
    token20 = Gemmes(token20_addr);
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
    for (; i < distributed_token721 + _value * factor; i ++) {
        ERC721Basic.transferFrom(_to, _from, i);
    }
    distributed_token721 = i;
}
    
}
