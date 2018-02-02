contract initialiation {
    
    uint nombre_de_joueur;
    
    liste_participant [nombre_de_joueur] public liste_participant; // la liste s'initialise à 0

    
function initialisation_loup_garou(nombre_de_joueur)
{
    uint nmb_loup_garou;
    if (nombre_de_joueur<8 && nombre_de_joueur>18)
    {
        selfdestruct(msg.sender);
    }
    if (nombre_de_joueur>=12 && nombre_de_joueur<=18)
    {
        nmb_loup_garou=3;
    }
    else 
    {
     nmb_loup_garou=2;
    }
    uint number;
    uint number2;
    uint number3;
    if (nmb_loup_garou == 2)
    {
    number=uint(block.blockhash(block.number-1))%nombre_de_joueur; //il n'est pas possible de générer un nombre aléatoire, on se base sur le hash du dernier bloc généré, converti en entier et on ajoute modulo le nombre de participants
    number2=uint(block.blockhash(block.number-1))* 2 % nombre_de_joueur;
    liste_partcipant[number].value=1;
    liste_partcipant[number2].value=1;
    }
    if (nmb_loup_garou == 3)
    {
    number=uint(block.blockhash(block.number-1))%nombre_de_joueur; //il n'est pas possible de générer un nombre aléatoire, on se base sur le hash du dernier bloc généré, converti en entier et on ajoute modulo le nombre de participants
    number2=uint(block.blockhash(block.number-1))* 2 % nombre_de_joueur;
    number3=uint(block.blockhash(block.number-1))* 3 % nombre_de_joueur;
    liste_participant[number].value=1;
    liste_participant[number2].value=1;
    liste_participant[number3].value=1;
    }
    
    return liste_participant ;
}
    
// le jeu est initialisé, on possède une liste avec le nombre de joueur,dans cette liste
//la ième position correspond au ième joueur. Si il est initialisé à 0 c'est un villageois, si il
//est initialisé à 1 c'est un loup garou
}
