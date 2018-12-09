https://ropsten.etherscan.io/address/0xb881edb3fe528ff9412dc364e86685ac2beeb410

pragma solidity ^0.4.21;
import "./ERC20Gemmes.sol";

contract UBSav {
    
    //Retrieved via a server
    uint32 x;
    uint32 y; 
    uint32 z;
    address player;
    //Set relative to the place of the distribution of the gemmes
    uint32 x1=9000000;
    uint32 x2=11000000;
    uint32 y1=33000000;
    uint32 y2=35000000;
    uint16 z1=200;
    uint16 z2=400;
    uint128 value = 10*(10**18);
    
    event Transfer(address _to, uint256 value);

    function SendCoin(uint32 _x, uint32 _y, uint32 _z, address _player) public {//now is the timestamp of the current block in seconds since unix time
        if (now>1544353261){//https://www.epochconverter.com/ to find the number corresponding to the date
            if (now<1544353261 + 50 weeks){ //end date if the campaign lasts 50 weeks(days,minutes, seconds work)
                if(msg.sender==0x95Ea183985ea4F5f2a18bf07dB37eB401e768c73){ 
                    x = _x;
                    y = _y;
                    z =_z;
                    player = _player;
                    if ( x1<x && x<x2 && y1<y && y<y2 && z1<z && z<z2){
                        Gemmes(0xe02005819E60b16E3eBaa040df7d3394AF9AC12e).transfer(_player,value); //address tokenERC20 gemmes
                        emit Transfer(_player,value);
                    }
                }
            }
            else{
                address ubisoft=0x95Ea183985ea4F5f2a18bf07dB37eB401e768c73; 
                uint tokenBalance = Gemmes(0xe02005819E60b16E3eBaa040df7d3394AF9AC12e).balanceOf(address(this));
                Gemmes(0xe02005819E60b16E3eBaa040df7d3394AF9AC12e ).transfer(ubisoft,tokenBalance);
                emit Transfer(ubisoft,tokenBalance);
                selfdestruct(ubisoft);//kill the contract and return the tokens of the contract to Ubisoft
            }
        }
   }
   
   function getSendCoin() public constant returns (uint32, uint32, uint32, address) {
       return (x, y, z, player);
   }
    
}
