/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a 
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() { 
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>') 
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */
var HDWalletProvider = require ("truffle-hdwallet-provider");
var mnemonic = "nephew flock begin verify collect stairs slice peace stove wish vacant puzzle";

module.exports={ //paramètres de connexion pour se connecter a ganache
	networks : {
		development: {
			host: "127.0.0.1",
			port: 8545,
			network_id:"*",
			gas: 4500000,
			gasPrice: 10000000000,
		},
		ropsten: {
		  provider: function(){
			return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/");
		  },
		network_id: '*',
		gas: 4500000,
		gasPrice: 10000000000,
		},
	}
};
