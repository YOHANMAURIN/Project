# Schnorr signature 

The aims of this reposiory is to deelop a new implementation of the Schnorr signature. This project is supervised by Chainsmith Limited.

### Signature

The signature needs to satisfy the following condition sG = R + H(r || P || m)P using a signature (r,s) with r the X coordinate of a point R on the curve whose Y coordinate is a quadratic residue 



### Some ideas

Pseudo Code : https://github.com/sipa/bips/blob/bip-schnorr/bip-schnorr.mediawiki?fbclid=IwAR0W6Szwje9lX37Vwgrro84O_eP43kqeZWAVhtOK3_KuM84cra9BzQPzTFQ#Verification

Code : https://github.com/sipa/bips/blob/bip-schnorr/bip-schnorr/reference.py 
