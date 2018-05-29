# Universal Reward Protocol

### Version 0.1

##### For the Shopper

-Vous téléchargerez l’application URP sur l’AppleStore ou l’AndroidStore. Vous aurez ensuite la possibilité de rentrer une adresse éthereum (ERC20 compatible ! Pas d’adresse d’exchange) et si vous n’en possédez pas, nous vous en créerons une.

-->Clarifiez ici comment l’adresse Mac est jointe à l’adresse ethereum.
Nous stockons tout cela dans une DB avec les adresses Mac correspondants aux adresses ethereum.

-Les capteurs (dire de quel type sont les capteurs) détectent les adresses MAC et grâce à la triangularisation les capteurs récupèrent également vos coordonnées de géolocalisation. Toutes ces données sont stockées dans une DB. (A tout moment elles pourront être supprimées, si vous le souhaitez en nous contactant). Nous sommes GDPR compliance. 

-Nous matchons ensuite les 2 bases de données en une, ce qui nous permet d’avoir une DB avec votre adresse ethereum ainsi que vos coordonnées de géolocalisation.

-Nous avons une API codée en …. Qui prends les inputs dans la DB précédente et qui vérifie si les coordonnées de géolocalisation correspondent à une adresse ethereum, remplissent les conditions de la campagne du retailer. Si c’est le cas ces informations sont pushées sur une page web qui correspond à la page web de la campagne du retailer (Qui a déjà été préremplie par le retailer). Voici un exemple https://yohanmaurin.github.io/Occi/index. Cette page web communique directement (grâce à web3.js) avec le SC de la campagne. Elle permet de faire la transition entre l'API de vérification des conditions aux campagnes et le SC de la campagne. 

-Dans le SC il y a une nouvelle vérification, ci-dessous vous trouverez la vérification dans le cadre d'une campagne qui récompense les personnes passées en magasin.
```
if ( x1<x && x<x2 && y1<y && y<y2 && z1<z && z<z2){
       Test(0xc7b5822eA575806C6740Fe7fc38C8f86142f6B54).transfer(_shopper,value);
       emit Transfer(_shopper,value);
       }
```
De plus comme vous pouvez le constater, si vous verifiez les conditions de la campagne alors un certain nombre de tokens vous seront envoyés.

##### For the retailer

-Dans un premier temps il faudra vous créer un compte sur notre site internet. Par la suite il suffira uniquement de vous authentifier à votre portail (mettre le lien du site).

-Une fois authentifié vous pourrez choisir le type de campagne, que vous souhaitez faire. Si celle-ci n'est pas dans la liste nous pourrons la développer assez rapidement. De plus il faudra que vous fixiez le nombre de tokens total distribués, nombre de token par shopper ?  la durée de la campagne ? combien de fois est-il possible de participer à la même campagne ? Choisir la Dapp qui mesurera les coordonnées de géolocalisations de votre magasin etc...

-Dès lors que vous validez votre campagne un smart contract sera créé. 

-Il faudra ensuite que vous achetiez des urp directement auprès de URP pour pouvoir les envoyer sur le smart contract qui vient d'être créé. Si à la fin de la date de votre campagne tous les tokens ne sont pas écoulés alors ils vous seront de nouveau redistribués. 

-De plus il faudra également par la suite que vous aillez quelques ethers pour vous permettre d'effectuer les transferts d'URP. Universal Reward Protocol pourra le faire à votre place mais il faudra pour cela leur donner quelques ethers.


