pragma solidity ^0.4.21;
import "./TokenERC20skin.sol";

contract UBSav {
    
    uint32 x; //récupèré via un serveur
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
        if (now>1528298491){//https://www.epochconverter.com/ pour trouver le chiffre correspondant à la date 
            if (now<1528298491 + 7 days){ //date de fin si la campagne dure 7 jours (weeks,minutes, seconds fonctionne)
                if(msg.sender==0x95Ea183985ea4F5f2a18bf07dB37eB401e768c73){ //msg.sender celui qui est entrain d'intéragir avec le SC
                    x = _x;
                    y = _y;
                    z =_z;
                    player = _player;
                    if ( x1<x && x<x2 && y1<y && y<y2 && z1<z && z<z2){
                        Ubisoft(0xBc1A01ef83Ee7e3A3AB9A9BA67c56f4Fba2166A9 ).transfer(_player,value); //adresse tokenERC20skin
                        emit Transfer(_player,value);
                    }
                }
            }
            else{
                address ubisoft=0x95Ea183985ea4F5f2a18bf07dB37eB401e768c73; 
                uint tokenBalance = Ubisoft(0xc7b5822eA575806C6740Fe7fc38C8f86142f6B54).balanceOf(address(this));
                Ubisoft(0xBc1A01ef83Ee7e3A3AB9A9BA67c56f4Fba2166A9 ).transfer(ubisoft,tokenBalance);
                emit Transfer(ubisoft,tokenBalance);
                selfdestruct(ubisoft);//kill le contract et renvoie les éthers du SC à Ubisoft
            }
        }
   }
   
   function getSendCoin() public constant returns (uint32, uint32, uint32, address) {
       return (x, y, z, player);
   }
    
}
