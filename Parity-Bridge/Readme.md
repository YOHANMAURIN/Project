# Parity Bridge

This repository aims to explain to you how to deploy a blockchain in Proof of Authority locally on linux, as well as to deploy parity-bridge between your blockchain and a sidechain.

## Setup

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
    
### Blockchain Setup

The file demo-spec.json is to setup the config of the chain with a PoA (Aura)
The file node0.toml and node1.toml is to setup the nodes

#### Creation of 3 accounts: 2 authorities accounts and a user account






