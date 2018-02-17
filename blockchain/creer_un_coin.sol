pragma solidity ^0.4.0;

contract newToken {
    mapping (address => uint256) public balanceOf;
    
    function newToken() public {
        uint256 supply = 100;
        balanceOf[msg.sender] = supply;
        
    }

    function totalSupply() public constant returns (uint256 supply) {}
    
    
}
