const Contacts = artifacts.require("StudentListStorage.sol");
module.exports = async function (callback) {
  const StudentStorage = await Contacts.deployed();
  await StudentStorage.setList("sroxck", 100);
  const res = await StudentStorage.getList();
  // console.log(res, "res");
  console.log(await StudentStorage.StudentList(0), "res");

  callback();
};
