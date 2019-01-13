# The aim of this repository is to simulate the ropsten network on your computer

1 . You have this setup of the chain in the file "spec.json"

2 . You need to set-up a new node for this chain. You have the code in the config.toml file.

3 . Some configuration to run:

    parity --config config.toml
    
    # In the other shell
    curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["node", "node"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8542
    # The address return is 0x005eb3d86d6c987860fbc95ab97da69ee6b6118e if you put exactly the same line

    curl --data '{"jsonrpc":"2.0","method":"parity_newAccountFromPhrase","params":["user1", "user1"],"id":0}' -H "Content-Type: application/json" -X POST localhost:8542   
    # The address return is 0x00d695cd9b0ff4edc8ce55b493aec495b597e235 if you put exactly the same line

4 . Put your password in the file node.pwds

5 . Add in your file config.toml 

``
[account]
unlock = [
  "0xb1b183fe86c6fde9c2e2a42d94a6c7846d288e60",
]
password = ["node.pwds"]

[mining]
engine_signer = "0xb1b183fe86c6fde9c2e2a42d94a6c7846d288e60"
author = "0xb1b183fe86c6fde9c2e2a42d94a6c7846d288e60"
#reseal_on_txs = "none"
reseal_min_period = 0
min_gas_price = 0
``

Run again : 

    parity --config config.toml
