pragma solidity ^0.4.24;

contract Vote {
    
    uint256 participants_number = 0; 
    address owner = msg.sender; //by default the owner of the SC is the person who deployed it
    
    struct Questions
    {
    mapping (address => bool) canvote;
    address ownerQuestion;
    uint256 startDate;
    uint256 endDate;
    uint256 decision1; // 1 : For
    uint256 decision2; // 2 : Against
    uint256 decision3; // 3 : White
    mapping (address => mapping (address => bool)) allowance;
    }
    
    mapping (uint => Questions) idQuestion;
    
    uint256 percentage = 0;
    uint8 winner = 0;

    
    event eventVote(uint id, address _to, uint8 value);
    event newOwner(address actionBy,address newOwner);
    event newQuestionOwner(uint id, address actionBy,address newOwner);
    event newRegister(uint id,address registerBy, address newVoter);
    event newListRegister(uint id, address listRegisterBy, address [] listVoter);
    event deleteRegister(uint id, address deleteBy, address registerToDelete);
    event Allowance (uint id, address giveBy, address allowance);
    event eventDeleteAllowance (uint id, address deleteAllowanceBy, address allowanceToDelete);
    
    
    modifier onlyBy(address _account)
    {
        require(
            msg.sender == _account,
            "Sender not authorized."
        );
        // "_;" will be replaced by the actual function
        // body when the modifier is used.
        _;
    }
    
    //Allow to change the owner of the SC
    function changeOwner(address _newOwner)
        public
        onlyBy(owner)
    {
        owner = _newOwner;
        emit newOwner(msg.sender,_newOwner);
    }
    
    //Allow to see the owner of the SC
    function ownerContract () public view returns (address){
        return (owner) ;
    }
    
    //Allow to set up a new question for a vote
    function setSettingsQuestion (uint id, address ownerOfQuestion, uint startDate, uint endDate) public onlyBy(owner) returns (bool){
        idQuestion[id].ownerQuestion = ownerOfQuestion ;
        idQuestion[id].startDate = startDate ;
        idQuestion[id].endDate = endDate ;
    }
    
    //Allow to change the start date of a vote
    function changeStartDate (uint id, uint newStartDate) public returns (bool){
        require(msg.sender == idQuestion[id].ownerQuestion);
        idQuestion[id].startDate = newStartDate ;
        return(true);
    }
    
    //Allow to see the start date
    function showStartDate (uint id) public view returns (uint256){
        return (idQuestion[id].startDate);
    }
    
    //Allow to change the end date of a vote
    function changeEndDate (uint id, uint newEndDate) public returns (bool){
        require(msg.sender == idQuestion[id].ownerQuestion);
        idQuestion[id].startDate = newEndDate ;
        return(true);
    }
    
    //Allow to see the end date
    function showEndDate (uint id) public view returns (uint256){
        return (idQuestion[id].endDate);
    }
    
    //Allow to change the owner of the referendum question 
    function newOwnerQuestion (uint id, address setOwnerQuestion) public returns (bool){
        require(msg.sender == idQuestion[id].ownerQuestion);
        idQuestion[id].ownerQuestion = setOwnerQuestion ;
        return(true);
        emit newQuestionOwner(id,msg.sender, setOwnerQuestion);
    }
    
    //Show the owner of the referendum question
    function showOwnerQuestion (uint id) public view returns (address){
        return (idQuestion[id].ownerQuestion);
    }
    
    //Allow to see if an address can vote or not
    function canVote (uint id, address voter) public view returns (bool){
        if (idQuestion[id].canvote[voter]== true){
            return (true);
        }
    }
    
    //Allow the owner of the referendum to give a vote right to a specific address
    function registerVoter (uint id, address Register) public returns (bool) {
        require (msg.sender == idQuestion[id].ownerQuestion);
        idQuestion[id].canvote[Register] = true;
        emit newRegister(id,msg.sender, Register);
        return(true);
    }
    
    //Allow the owner of the SC to give a vote right to a list of address
    function registerList (uint id, address [] voters) public returns (bool){
        require (msg.sender == idQuestion[id].ownerQuestion);
        uint256 size = voters.length;
        while (size != 0){
            idQuestion[id].canvote[voters[size-1]]=true;
            size = size -1;
        }
        emit newListRegister(id, msg.sender, voters);
        return(true);
    }
    
    //Allow the owner of the SC to delete a vote right to an address
    function deleteVoter (uint id, address toDelete) public returns (bool){
        require (msg.sender == idQuestion[id].ownerQuestion);
        require (idQuestion[id].canvote[msg.sender] = true);
        idQuestion[id].canvote[toDelete] = false;
        emit deleteRegister (id,msg.sender, toDelete);
        return(true);
    }
    
    //Allow an address to give his vote right to another address
    function giveAllowance (uint id, address receiver) public returns (bool){
        require (msg.sender == idQuestion[id].ownerQuestion);
        require (idQuestion[id].canvote[msg.sender] = true);
        idQuestion[id].allowance[receiver][msg.sender] = true;
        idQuestion[id].canvote[msg.sender] = false;
        emit Allowance(id,msg.sender, receiver);
        return (true);
    }
    
    //Allow an address to verify if the address A have his vote right
    function haveAllowance (uint id, address receiver) public view returns (bool){
        return(idQuestion[id].allowance[receiver][msg.sender]);
    }
    
    //Allow an address to delete his vote right he had given to receiver
    function deleteAllowance (uint id, address receiver) public returns (bool){
        require (msg.sender == idQuestion[id].ownerQuestion);
        require (idQuestion[id].allowance[receiver][msg.sender] = true) ;
        idQuestion[id].allowance[receiver][msg.sender] = false ;
        idQuestion[id].canvote[msg.sender] = true ;
        emit eventDeleteAllowance(id,msg.sender,receiver);
        return(true);
    }
    
    //Allow an address to vote (1,2 or 3)
    function funcVote (uint256 id, uint8 vote) public returns (bool){
        require(idQuestion[id].canvote[msg.sender] == true ); 
        require(now>idQuestion[id].startDate);
        
        if (now<idQuestion[id].endDate)
        {
            if (vote == 1){
                idQuestion[id].decision1 = idQuestion[id].decision1 + 1;
            }
            if (vote == 2){
                idQuestion[id].decision2 = idQuestion[id].decision2 + 1;
            }
            if (vote == 3){
                idQuestion[id].decision3 = idQuestion[id].decision3 + 1;
            }
            idQuestion[id].canvote[msg.sender] = false; //allows to have only one vote by person
            emit eventVote(id,msg.sender,vote);
            return(true);
        }
        else{
            result(id);
            return(true);
        }
    }
    
    //Allow an address which have the vote right of an another address to vote for her
    function allowedVote (uint id, address allowsVote, uint8 vote) public returns (bool){
        require(idQuestion[id].allowance[msg.sender][allowsVote] = true);
        require(now>idQuestion[id].startDate);
        
        if (now<idQuestion[id].endDate)
        {
            if (vote == 1){
                idQuestion[id].decision1 = idQuestion[id].decision1 + 1;
            }
            if (vote == 2){
                idQuestion[id].decision2 = idQuestion[id].decision2 + 1;
            }
            if (vote == 3){
                idQuestion[id].decision3 = idQuestion[id].decision3 + 1;
            }
            idQuestion[id].allowance[msg.sender][allowsVote] = false; //allows to have only one vote by person
            return (true);
            emit eventVote(id,allowsVote,vote);
        }
        else{
            result(id);
            return (true);
        }
    }
    
    // Allow to see the number of vote for
    function voteFor(uint id) public view returns (uint256){
        return (idQuestion[id].decision1);
    }
    
    // Allow to see the number of vote against
    function voteAgainst(uint id) public view returns (uint256){
        return (idQuestion[id].decision2);
    }
    
    // Allow to see the number of white vote
    function whiteVote(uint id) public view returns (uint256){
        return (idQuestion[id].decision3);
    }
    
    // Allow to calculate the vote result
    function result(uint id) public returns (bool) { // we will see if we pass this function as an internal function
        
        participants_number = idQuestion[id].decision1 + idQuestion[id].decision2 + idQuestion[id].decision3;
        
        if (participants_number != 0){
            if ((idQuestion[id].decision1*10000)/participants_number>(idQuestion[id].decision2*10000)/participants_number){
                winner = 1 ;
                percentage = (idQuestion[id].decision1*10000)/participants_number;
                return (true);
            }
            else {
                if ((idQuestion[id].decision1*10000)/participants_number<(idQuestion[id].decision2*10000)/participants_number){
                    winner = 2 ;
                    percentage = (idQuestion[id].decision2*10000)/participants_number;
                    return (true);
                }
                else {
                    winner = 3; //equality
                    percentage = (idQuestion[id].decision2*10000)/participants_number;
                    return (true);
                }
            }
        }
        else {
            return (false);
        }
    }
    
    // Allow to see the vote result
    // Need to use the function result before to use this function
    function showResult () public view returns (uint8, uint256){
        return (winner,percentage); // the percentage will be return with 2 decimals
    }
}