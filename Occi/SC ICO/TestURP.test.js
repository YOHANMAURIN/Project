const { assertRevert } = require ('./assertRevert')
const URPToken = artifacts.require('./UniversalRewardProtocolToken.sol')

const BigNumber = web3.BigNumber;

require('chai')
  .use(require('chai-bignumber')(BigNumber))
  .should();

contract('URPToken', () => {
  let token
  const ZERO_ADDRESS = '0x0000000000000000000000000000000000000000';
  const owner = 0x9fD1dC18f5240173bAC84446aBA9F5AF52b1FE29 ;
  const to = 0xD51691f27343c0278f6Ca437e95B2a3BC67C109A ;

  beforeEach(async () => {
    token = await URPToken.deployed()
  })

  it('has a name', async () => {
    const name = await token.name()
    name.should.be.equal('Universal Reward Protocol')
  })

  it('possesses a symbol', async () => {
    const symbol = await token.symbol()
    symbol.should.be.equal('URP')
  })

  it('contains 18 decimals', async () => {
    const decimals = await token.decimals()
    decimals.should.be.bignumber.equal(18)
  })

  it('contains INITIAL_SUPPLY', async () => {
    const initial_supply = await token.INITIAL_SUPPLY()
    initial_supply.should.be.bignumber.equal(50000000000 * (10**18))
  })

   describe('transfer', function () {
    describe('when the recipient is not the zero address', function () {

      describe('when the sender does not have enough balance', function () {
        const amount = 101;

        it('reverts', async function () {
          await assertRevert(this.token.transfer(to, amount, { from: owner }));
        });
      });

      describe('when the sender has enough balance', function () {
        const amount = 100;

        it('transfers the requested amount', async function () {
          await assertRevert(this.token.transfer(to, amount, { from: owner }));
	  console.log(this.token.transfer(to, amount));

          (await this.token.balanceOf(owner)).should.be.bignumber.equal(0);

          (await this.token.balanceOf(to)).should.be.bignumber.equal(amount);
        });

        it('emits a transfer event', async function () {
          const { logs } = await this.token.transfer(to, amount, { from: owner });

          const event = expectEvent.inLogs(logs, 'Transfer', {
            from: owner,
            to: to,
          });

          event.args.value.should.be.bignumber.equal(amount);
        });
      });
    });
	describe('when the recipient is the zero address', function () {
     	 const to = ZERO_ADDRESS;

      	it('reverts', async function () {
        	await assertRevert(this.token.transfer(to, 100, { from: owner }));
      });
    });
  });


});
