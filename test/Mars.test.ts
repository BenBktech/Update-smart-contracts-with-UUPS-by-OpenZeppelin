import hre from 'hardhat' 
import assert from 'assert'
import { util } from 'chai'

before('get factories', async function() {
  this.Mars = await hre.ethers.getContractFactory('Mars')
  this.MarsV2 = await hre.ethers.getContractFactory('MarsV2')
  this.MarsV3 = await hre.ethers.getContractFactory('MarsV3')
})

it('goes to mars', async function() {
  //this line deploys the implementation (mars contract), it then deploys a proxy admin and then it deploys the proxy connecting of all that together
  const mars = await hre.upgrades.deployProxy(this.Mars, {kind: 'uups' })
  assert(await mars.name() === 'Mars')

  const marsV2 = await hre.upgrades.upgradeProxy(mars, this.MarsV2);
  assert(await marsV2.version() === 'V2!')

  const marsV3 = await hre.upgrades.upgradeProxy(mars, this.MarsV3);
  assert(await marsV3.version() === 'V3!')
  
  await marsV3.setTax(5);
  let tax = await marsV3.getTax();
  assert(tax.toString() === '5')
})