pragma solidity ^0.4.0;
contract Voting {
    
    uint public nombre_de_joueur;
    
    struct Joueurs
    {
    address addressparticipants;
    uint8 role; //0 recrue, 1 chef 
    address vote_contre;
    }
    
    Joueurs[] public liste_joueurs; // la liste s'initialise à 0
    
    address public owner;
    function owned() public { owner = msg.sender; }

    
    mapping(address => uint) public vote_contre;
    
    function vote_chef(address voteChoice) public //Voter pour éliminer une personne 
    {
        uint indice = nombre_de_joueur;
        while (indice>0)
        {
            if (liste_joueurs[indice].role==1)
            {
               //if(voteChoice != liste_participants.length) throw;
                liste_joueurs.push( Joueurs({
                    addressparticipants : msg.sender,
                    role : 1,
                    vote_contre: voteChoice
                    
                        })
                    );
                    vote_contre [voteChoice]+=1;
            }
            indice=indice -1;
        }
        //totaliser les votes et éliminer la personne
    }
    
    
    function vote_all (address voteChoice) public  //lorsque l'une personne veut rentrer dans le clan
    {
        uint indice = nombre_de_joueur;
        while (indice>0)
        {
            if (liste_joueurs[indice].role==0)
            {
                liste_joueurs.push( Joueurs({
                    addressparticipants : msg.sender,
                    role : 0,
                    vote_contre: voteChoice
                    
                        })
                    );
                vote_contre [voteChoice]+=1;
            }
            if (liste_joueurs[indice].role==1)
            {
                liste_joueurs.push( Joueurs({
                    addressparticipants : msg.sender,

                    role : 1,
                    vote_contre: voteChoice
                    
                        })
                    );
                    vote_contre [voteChoice]+=1;
            }
            indice=indice -1;
        }
        //totaliser les votes et éliminer la personne 
    }
    
    
    function kill() public {
        if (msg.sender == owner) selfdestruct(owner);
    }
    

}
