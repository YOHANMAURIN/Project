pragma solidity ^0.4.0;

contract newToken {
    mapping (address => uint256) public balanceOf;
    uint256 supply;
    address _to;
    uint256 _value;
    
    function newToken(uint256 supply) public {
        //uint256 supply = 50;
        balanceOf[msg.sender] = supply;
        
    }


    function transfer(address _to, uint256 _value) {
        /* Check if sender has balance and for overflows */
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);

        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}
