Acte de notaire et proof of existence - Projet réalisé par Maurin Yohan - Cysique Frédéric - Lopes Wendy

<br>Comme vous pouvez le voir le smart contract est très basique il permet juste de stocker un string et ce string sera le hash du document notarial. </br>


<br>Comment avoir le hash ?</br>
<br>A terme il y aura une partie front end qui permettra de déposer un document, ensuite une partie middle office qui permettra de hasher le document avec la fonction de hashage SHA256 et une partie back end qui va récupéré le hash et qui va interagir avec le smart-contract. Finalement après ces  3 parties nous avons donc le hash stocké dans la blockchain. Nous nous avons uniquement fait le smart contract </br>


Attention: En aucun cela permet de stocker notre document, en revanche cela permet de savoir si notre document a été modifié. Il suffit de hasher notre document et de comparer les 2 hashs pour savoir si il a été modifié. 
