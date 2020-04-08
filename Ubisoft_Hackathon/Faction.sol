pragma solidity ^0.4.21;
contract Voting {
    
    uint public nombre_de_joueur;
    bool majority = false;
    
    struct Joueurs
    {
    address addressparticipants;
    uint8 role; //0 recrue, 1 chef
    bool decision;
    }
    
    Joueurs[] public liste_joueurs; // la liste s'initialise à 0
    
    address public owner;
    function owned() public { owner = msg.sender; }
    
    function vote_chef(bool voteChoice) public //Voter pour éliminer une personne
    {
        uint indice = nombre_de_joueur;
        uint nombre_vote = 0 ;
        while (indice>0)
        {
            if (liste_joueurs[indice].role==1)
            {
                liste_joueurs.push( Joueurs({
                    addressparticipants : msg.sender,
                    role : 1,
                    decision: voteChoice
                    
                        })
                    );
                    if (liste_joueurs[indice].decision == true)
                    {
                        nombre_vote ++;
                    }
            }
            indice=indice -1;
        }
        if ((nombre_de_joueur/nombre_vote)*100>50){
            majority = true;
        }
    }
    
    
    function vote_all (bool voteChoice) public //lorsque l'une personne veut rentrer dans le clan
    {
        uint indice = nombre_de_joueur;
        uint nombre_vote = 0 ;
        while (indice>0)
        {
            if (liste_joueurs[indice].role==0)
            {
                liste_joueurs.push( Joueurs({
                    addressparticipants : msg.sender,
                    role : 0,
                    decision: voteChoice
                    
                        })
                    );
                    if (liste_joueurs[indice].decision == true)
                    {
                        nombre_vote ++;
                    }
            }
            if (liste_joueurs[indice].role==1)
            {
                liste_joueurs.push( Joueurs({
                    addressparticipants : msg.sender,

                    role : 1,
                    decision: voteChoice
                    
                        })
                    );
                    if (liste_joueurs[indice].decision == true)
                    {
                        nombre_vote ++;
                    }
            }
            indice=indice -1;
        }
        if ((nombre_de_joueur/nombre_vote)*100>50){
            majority = true;
        }
    }
    
    function kill() public {
        if (msg.sender == owner) selfdestruct(owner);
    }
    
}
