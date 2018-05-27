pragma solidity ^0.4.18;
import "./TokenTest.sol";

contract URPav {
    
    uint8 x; //récupèré via l’API Occi
    uint8 y; 
    uint8 z;
    address shopper;
    event Transfer(address _to, uint256 value);
   function SendCoin(uint8 _x, uint8 _y, uint8 _z, address _shopper) public {
       uint8 x1=9 ;
       uint8 x2=11;
       uint8 y1=33;
       uint8 y2=35;
       uint8 z1=2;
       uint8 z2=4;
       uint256 value = 10*(10**18);
       x = _x;
       y = _y;
       z =_z;
       shopper = _shopper;
       if ( x1<x && x<x2 && y1<y && y<y2 && z1<z && z<z2){
       Test(0xc7b5822eA575806C6740Fe7fc38C8f86142f6B54).transfer(_shopper,value);
       emit Transfer(_shopper,value);
       }
   }
   
   function getSendCoin() public constant returns (uint8, uint8, uint8, address) {
       return (x, y, z, shopper);
   }
    
}
