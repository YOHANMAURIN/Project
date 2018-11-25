// adresse contrat https://ropsten.etherscan.io/address/0x388cd4db6f12a5e51cc6222b39200f79f439e092

pragma solidity ^0.4.21;
import "./Gemmes.sol";

contract UBSav {
    
    uint32 x; //récupèré via un server 
    uint32 y; 
    uint32 z;
    address player;
    uint32 x1=9000000;
    uint32 x2=11000000;
    uint32 y1=33000000;
    uint32 y2=35000000;
    uint16 z1=200;
    uint16 z2=400;
    uint128 value = 10*(10**18);
    event Transfer(address _to, uint256 value);

    function SendCoin(uint32 _x, uint32 _y, uint32 _z, address _player) public {//now est le timestamp du bloc actuel en secondes depuis l'époque unix
        if (now>1530364991){//https://www.epochconverter.com/ pour trouver le chiffre correspondant à la date 
            if (now<1530364991 + 2 days){ //date de fin si la campagne dure 2 jours (weeks,minutes, seconds fonctionne)
                if(msg.sender==0x95Ea183985ea4F5f2a18bf07dB37eB401e768c73){ 
                    x = _x;
                    y = _y;
                    z =_z;
                    player = _player;
                    if ( x1<x && x<x2 && y1<y && y<y2 && z1<z && z<z2){
                        Gemmes(0xD4008fAEdb116C166EacE4cDf4CBb7853df7C519).transfer(_player,value); //adresse tokenERC20skin
                        emit Transfer(_player,value);
                    }
                }
            }
            else{
                address ubisoft=0x95Ea183985ea4F5f2a18bf07dB37eB401e768c73; 
                uint tokenBalance = Gemmes(0xD4008fAEdb116C166EacE4cDf4CBb7853df7C519).balanceOf(address(this));
                Gemmes(0xD4008fAEdb116C166EacE4cDf4CBb7853df7C519 ).transfer(ubisoft,tokenBalance);
                emit Transfer(ubisoft,tokenBalance);
                selfdestruct(ubisoft);//kill le contract et renvoie les éthers du SC à Ubisoft
            }
        }
   }
   
   function getSendCoin() public constant returns (uint32, uint32, uint32, address) {
       return (x, y, z, player);
   }
    
}
