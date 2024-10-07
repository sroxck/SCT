// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
contract SroxckToken {
    using SafeMath for uint256;

    // 代币名称
    string public name = "SroxckToken";
    // 代币符号
    string public symbol = "SCT";
    // wei 的小数  1SCT = 10 ** decimals
    uint public decimals = 18;
    // 总发行量
    uint public totalSupply;
    // 余额
    mapping(address => uint256) public balanceOf;
    // 账号映射交易所授权结构
    mapping(address => mapping(address=>uint256)) public allowance;
    // 自动执行constructor
    constructor() {
        totalSupply = 1000000 * (10 ** decimals);
        // constructor 中的msg.sender 就是配置中账号的第一个账号,或者是form的账号
        balanceOf[msg.sender] = totalSupply;
    }
    //转账
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_to != address(0));
        _tranfer(msg.sender, _to, _value);
        return true;
    }
    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        // msg.sender 当前网页登录的账号
        // _spender 第三方的交易所账号地址
        // _value是授权给第三方交易所管理的金额
        require(_spender !=address(0));

        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender,_spender,_value)
        return true;

    }
    // 交易所会调用这个,所以需要先approve 授权
    // 被授权的交易所调用这个方法
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        // from 放款账号
        // to 收款账号
        // value 💰
        // mgs.sender交易所账号地址
        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_valuev)
        _tranfer(_from, _to, _value);
    }
    function _tranfer(address _from, address _to, uint256 _value) internal {
        require(balanceOf[_from] >= _value);
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(_from, _to, _value);
    }
}
