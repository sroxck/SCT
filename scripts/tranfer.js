const SroxckToken = artifacts.require("SroxckToken.sol");
const fromWei = (bn) => {
  return web3.utils.fromWei(bn, "ether");
};
const toWei = (bn) => {
  return web3.utils.toWei(bn.toString(), "ether");
};
module.exports = async function (callback) {
  const sroxckToken = await SroxckToken.deployed();

  await sroxckToken.transfer(
    "0x3585CBd7A6c043bc06f125bc9F1B087665fC818d",
    toWei(10000),
    {
      from: "0x771Dee6b5dC9A61D4FE042033Ef391A2bd04d305",
    }
  );
  const res = await sroxckToken.balanceOf(
    "0x771Dee6b5dC9A61D4FE042033Ef391A2bd04d305"
  );
  const res2 = await sroxckToken.balanceOf(
    "0x3585CBd7A6c043bc06f125bc9F1B087665fC818d"
  );
  console.log(fromWei(res), "初始账户");
  console.log(fromWei(res2), "第二个账户");
  callback();
};
