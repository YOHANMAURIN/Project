pragma solidity ^0.4.0;

contract newToken {
    address _to;
    uint256 _value;
    uint256 supply;
    mapping(address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    
    function newToken(uint256 supply) public {
        //uint256 supply = 50; si on veut le rentrer en dure le nombre de token
        balanceOf[msg.sender] = supply;
        
    }


    function transfer(address _to, uint256 _value) {
        /* Check if sender has balance and for overflows */
        require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);

        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] -= _value;
    balances[_to] += _value;
    allowed[_from][msg.sender] +=_value;
    Transfer(_from, _to, _value);
    return true;
  }
}

