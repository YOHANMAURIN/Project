# Proof of Authority

## Blockchain Setup

The file demo-spec.json is to setup the config of the chain with a PoA (Aura). The file node0.toml and node1.toml is to setup the nodes.

#### Creation of 3 accounts: 2 authorities accounts and a user account

Run node0:

    parity --config node0.toml

Creation of the first authority: (other terminal)

    curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["node0", "node0"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540
The address return is 0x00bd138abd70e2f00903268f3db08f2d25677c9e if you put exactly the same line.

Creation of the user:

    curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["user", "user"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540
The address return is 0x004ec07d2329997267ec62b4166639513386f32e if you put exactly the same line.

Run node1:

    parity --config node1.toml

Creation of the second authority:

    curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["node1", "node1"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8541
The address return is 0x00aa39d30f0d20ff03a22ccfc30b7efbfca597c2 if you put exactly the same line.

Recap : The node0 has the authority account : 0x00Bd138aBD70e2F00903268F3Db08f2D25677C9e and the user account 0x004ec07d2329997267Ec62b4166639513386F32E. The node1 has the authority account: 0x00Aa39d30F0D20FF03a22cCfc30B7EfbFca597C2.

You need to __add the validor in the blockchain setup__. The name of the new file is demo-spec-new.json. Copy-Past this file in demo-spec.json .

#### Execute the authority node :

To run a node as an authority, we must allow it to sign transaction. For that, you have the file node.pwds. Each line contains a password that we used when authoring authority accounts.

Add the authority account in each node :
You have the new config in the file node0new.toml and the file node1new.toml. Copy paste the files in the files node0 and node1.

Run again the node:

    parity --config node0.toml
    parity --config node1.toml

#### Connect the nodes together

Retrieve the enode address of the node0:

    curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540

Add the RESULT to the node1:

    curl --data '{"jsonrpc":"2.0","method":"parity_addReservedPeer","params":["enode://RESULTAT"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8541
If the 2 nodes are well connected there is a message containing result: true which is returned.

#### Send token between the accounts

Send token between the user account to the authority of node0:

    curl --data '{"jsonrpc":"2.0","method":"personal_sendTransaction","params":[{"from":"0x004ec07d2329997267Ec62b4166639513386F32E","to":"0x00Bd138aBD70e2F00903268F3Db08f2D25677C9e","value":"0xde0b6b3a7640000"}, "user"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540

Once the transaction is submitted, a block is published a few seconds later (5 seconds depending on our settings). To verify if the authority of node0 received the funds:

    curl --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x00Bd138aBD70e2F00903268F3Db08f2D25677C9e", "latest"],"id":1}' -H "Content-Type: application/json" -X POST localhost:8540

Send token between the user account to the authority of node1:

    curl --data '{"jsonrpc":"2.0","method":"personal_sendTransaction","params":[{"from":"0x004ec07d2329997267Ec62b4166639513386F32E","to":"0x00Aa39d30F0D20FF03a22cCfc30B7EfbFca597C2","value":"0xde0b6b3a7640000"}, "user"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540
    
Verify if the authority of node1 received the funds:

    curl --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0x00Aa39d30F0D20FF03a22cCfc30B7EfbFca597C2", "latest"],"id":1}' -H "Content-Type: application/json" -X POST localhost:8541

NB: The value is in hexadecimal (Here is a good converter http://sebastienguillon.com/test/javascript/converter.html). The value is 1 ETH in the above order lines

#### Deploy a node that does not have authority:

You have the config on the file node3.toml 

Run node3:
     
    parity --config node3.toml
    
You can connect this node to the user in the same way as we did above.
