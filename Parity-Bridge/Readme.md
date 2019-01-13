# Parity Bridge

This aim of the repository is to explain to you how to deploy a blockchain in Proof of Authority locally on linux, as well as to deploy parity-bridge between your blockchain and a sidechain.

## Setup infrastructure

### Prerequisite to install truffle 

Install npm :

    sudo apt install npm
    
Install nodejs:

    sudo apt-get update
    sudo apt-get install nodejs npm
    sudo ln –s /usr/bin/nodejs /usr/local/bin/node
    sudo ln -s /usr/bin/npm /usr/local/bin/npm

### Install truffle

    sudo npm install -g truffle 

### Other major installations

Install Rust:

It's to avoid problems with parity because the parity nodes are encoded in rust as a major part of the bridge

    sudo apt install curl
    curl https://sh.rustup.rs -sSf | sh 
    
Put cargo bin directory:

We need cargo to use rust, futhermore cargo is directly installed with rust just put it in the path

    source $HOME/.cargo/env 

Install Parity:

    bash <( curl https://get.parity.io -L) -r stable

## Parity-Bridge

Between Ropsten and the sidechain

### Set-Up

#### Install solc :

    npm install -g solc
    
If it doesn't work :

    npm install -g solc –save

If it doesn't work again run :
 
    sudo add-apt-repository ppa:ethereum/ethereum
    sudo apt-get update
    sudo apt-get install solc


#### Clone Parity-Bridge

    git clone https://github.com/paritytech/parity-bridge.git  #The version 2.0 of parity doesn't work, git clone my repositories who are the first version of parity-bridge 
    cd parity-bridge
    cargo build -p parity-bridge --release
    
### Deployment

#### Set-Up environment

##### Foreign Part

The foreign part of the foreignbridge corresponds to the sidechain in PoA that you had to create with the previous slides.
You must have at least one authority, the config of its node is in a node0bridge.toml file.

After run: 

     parity --config node0.toml 
     
NB : Automatically a node.ipc file is created in your urp directory

##### Home Part

There are two possibilities :

* You can run direclty a node on Ropsten. Be careful you will need 30 Gb for synchronization with the Ropsten network
    
      parity db kill --chain ropsten

      parity --chain ropsten --bootnodes "enode://20c9ad97c081d63397d7b685a412227a40e23c8bdc6688c6f37e97cfbc22d2b4d1db1510d8f61e6a8866ad7f0e17c02b14182d37ea7c3c8b9c2683aeb6b733a1@52.169.14.227:30303,enode://6ce05930c72abc632c58e2e4324f7c7ea478cec0ed4fa2528982cf34483094e9cbc9216e7aa349691242576d552a2a56aaeae426c5303ded677ce455ba1acd9d@13.84.180.240:30303“ 


* You can setup a second sidechain who are exactly the same setup than Ropten (go to the repository Ropsten_simulation)

    
#### Set-up build Parity-Bridge

Make a copy of the bridge_config.toml file found in "parity-bridge/integration-test" and put it directly in the parity-bridge folder.

Modify the bridge_config.toml file (be sure to take the one found in the "parity-bridge" directory)

In [home] put account = the address of the Ropsten node or the sidechain node that has been simulated which represents Ropsten.

In [home] put ipc = the absolute path (be careful not the relative) of the file that is created when you have run the node. This is the same path that you put when creating the node.

In [home.contract] put the path of the bin.

In [foreign] put the account of the authority of the sidechain PoA.

In [foreign] put ipc = the absolute path (be careful not the relative) of the file it is created when you have run the authority node.
It is the same ipc as when creating the node.

In [foreign.contract] put the path of the bin.

In [authorities] put the address of the authority of the sidechain PoA

You have an exemple in the file METTRE LE FILE ICI !!!!

In a new shell, go in the repository parity-bridge. Run :

    env RUST_LOG=info parity-bridge-deploy --config bridge_config.toml --database db.toml  #permit to deploy the bridge
    
You will probably have "sending HomeBridge contract deployment transaction and waiting for 0 confirmations .. "

You need to do a transaction on your home part. Run (in a new shell) :

    curl --data '{"jsonrpc":"2.0","method":"personal_sendTransaction","params":[{"from":"0x00d695cd9b0ff4edc8ce55b493aec495b597e235","to":"0x005eb3d86d6c987860fbc95ab97da69ee6b6118e","value":"0xde0b6b3a7640000"}, "user"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8542

If you have the same problem with the foreign part. You need again to do a transaction. Run : 

    curl --data '{"jsonrpc":"2.0","method":"personal_sendTransaction","params":[{"from":"0x004ec07d2329997267Ec62b4166639513386F32E","to":"0x00bd138abd70e2f00903268f3db08f2d25677c9e","value":"0xde0b6b3a7640000"}, "user"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540

As a reminder, the address 0x004 .. is that of the user of the sidechain PoA, the address 0x00b is the authority of the node0. (see beginning of the tutorial)

Run parity-bridge (in the folder parity-bridge) :

    env RUST_LOG=info parity-bridge --config bridge_config.toml --database db.toml 
    
Normally your bridge is deployed ! 











    








