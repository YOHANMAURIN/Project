pragma solidity ^0.4.21;
import "./ForeignBridge.sol";

 

contract URP {

    uint32 x; //récupèré via l’API Occi
    uint32 y;
    uint32 z;
    address shopper;
    uint32 x1=9000000;
    uint32 x2=11000000;
    uint32 y1=33000000;
    uint32 y2=35000000;
    uint16 z1=200;
    uint16 z2=400;
    uint128 value = 1*(10**18);
    address retailer=0x005Eb3D86d6C987860FBC95AB97DA69Ee6b6118E;
    event Transfer(address _to, uint256 value);

    function Refund() public
    {
        if (msg.sender==0x005Eb3D86d6C987860FBC95AB97DA69Ee6b6118E){
            uint tokenBalance = ForeignBridge(0xfe989a69356bab1b35e73d3d7d02ee5310e19005).balanceOf(address(this));
            ForeignBridge(0xfe989a69356bab1b35e73d3d7d02ee5310e19005).transfer(retailer,tokenBalance);
            emit Transfer(retailer,tokenBalance);
            selfdestruct(retailer);//kill le contract et renvoie les éthers du SC au retailer
        }   
    }

    function SendCoin(uint32 _x, uint32 _y, uint32 _z, address _shopper) public {//now est le timestamp du bloc actuel en secondes depuis l'époque unix
        if (now>1535202185){//https://www.epochconverter.com/ pour trouver le chiffre correspondant à la date
            if (now<1535202185 + 7 days){ //date de fin si la campagne dure 7 jours (weeks,minutes, seconds fonctionne)
                if(msg.sender==0x005Eb3D86d6C987860FBC95AB97DA69Ee6b6118E){ //msg.sender celui qui est entrain d'intéragir avec le SC
                    x = _x;
                    y = _y;
                    z =_z;
                    shopper = _shopper;
                    if ( x1<x && x<x2 && y1<y && y<y2 && z1<z && z<z2){
                        ForeignBridge(0xfe989a69356bab1b35e73d3d7d02ee5310e19005).transfer(_shopper,value);
                        emit Transfer(_shopper,value);
                    }
                }
            }
            else{
               Refund();
            }
        }
   }

   function getSendCoin() public constant returns (uint32, uint32, uint32, address) {
       return (x, y, z, shopper);
   }
}
