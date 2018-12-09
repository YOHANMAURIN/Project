# Universal Reward Protocol

### Version 0.1

##### For the Shopper

-You must download the URP application on the AppleStore or AndroidStore. You will be able to enter an Ethereum address (ERC20 compatible! No exchange address) and if you do not have one, we will create one for you.

-->Clarify here how the Mac address is attached to the ethereum address.
We store all this in a DB with the Mac addresses corresponding to ethereum addresses.

-The sensors (what type of sensors are) detect the MAC addresses and thanks to the triangularization the sensors also recover your geolocation coordinates. Your longitude and latitude are known with a precision of 6 digits after the decimal point and the accuracy of your altitude is 2 digits after the decimal point. All this data is stored in a DB. (At any time, they can be deleted, if you wish by contacting us). We are GDPR compliance. 
Moreover, to be in adequacy with Solidity which does not take a decimal point and there is no negative number, we decided to solve the problem of number to comma to multiply by 1,000,000 your latitute and longitude then to multiply by 100 your altitude. Finally we decided to add 180 000 000 of your latitude and longitude to stop having negative numbers. (Actually the longitude and latitute is between -180 and +180)

-We then match the two databases in one, which allows us to have a DB with your ethereum address and your geolocation coordinates.

-We have an API coded in .... Which takes the inputs in the previous DB and checks if the geolocation coordinates correspond to an ethereum address, fulfil the requirements of the retailer campaign. If this is the case, this information is pushed on a web page that corresponds to the web page of the retailer's campaign (which has already been pre-filled by the retailer). Here is an example https://yohanmaurin.github.io/Occi/index. This web page communicates directly (thanks to web3.js) with the SC of the campaign. It allows you the transition between the Campaign Condition Verification API and the Campaign SC.

-In the SC there is a new check, below you will find the check as part of a campaign that rewards people in the store.
```
if ( x1<x && x<x2 && y1<y && y<y2 && z1<z && z<z2){
       Test(0xc7b5822eA575806C6740Fe7fc38C8f86142f6B54).transfer(_shopper,value);
       emit Transfer(_shopper,value);
       }
```
x1, x2, y1, y2, z1, z2 correspond to the latitude, longitude and altitude of the ends of the store.

Moreover, as you can see, if you check the conditions of the campaign then a number of tokens will be send to you.

##### For the retailer

-At first you will have to create an account on our website. Thereafter it will only be necessary to authenticate to your portal (put the link of the site).

-Once authenticated, you can choose the type of campaign that you want to do. If it is not in the list, we can develop it quickly enough. In addition, it will be necessary that you fix the total number of tokens distributed, number of token by shopper? the duration of the campaign? How often is it possible to participate in the same campaign? Choose the Dapp that will measure the geolocation coordinates of your store etc ...

-When your campaign will be validated, a smart contract will be created.

-It will be necessary for you to buy urp directly from URP or directly on the market to be able to send them on the smart contract which has just been created. If at the end of the campaign date not all the tokens are distributed they will be redistributed again. . 

-In addition, it will also be necessary later that you have some ethers to allow you to make the transfers of URP. Universal Reward Protocol will be able to do it for you but it will take to give them some ethers.

