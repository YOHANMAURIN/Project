pragma solidity ^0.4.0;
contract Load {
    
    
    uint public caisse;
    bool voted1;
    bool voted2;
    bool voted3;
    
    uint credit3;
    uint credit1;
    uint credit2;
    
    uint demand; //ether 
    
    address _credit1;
    address _credit2;
    address _credit3;
    address _caisse;


    mapping(address => uint256) balances;
    mapping (address => mapping (address => uint256)) internal allowed;
    event Transfer(address indexed from, address indexed to, uint256 value);

    
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
  
    /// Create a new ballot with $(_numProposals) different proposals.
    function majority(uint participation) public {
        uint i=0;
            if (voted1 !=false){
                i=i+1;
            }
            if (voted2 !=false){
                i=i+1;
            }
            if (voted3 !=false){
                i=i+1;
            }
        
        if (i>(participation/2)){ //projet accepté
        transferFrom(_caisse,_credit1, demand); // we suppose that credit1 ask a microfinance
            
        }
        
        
    }
    
}
