const Contacts = artifacts.require("StudentStorage.sol");
module.exports = async function (callback) {
  const StudentStorage = await Contacts.deployed();
  await StudentStorage.setData("sroxck", 100);
  const res = await StudentStorage.getData();
  // console.log(res, "res");
  console.log(await StudentStorage.StudentList(0), "res");

  callback();
};
