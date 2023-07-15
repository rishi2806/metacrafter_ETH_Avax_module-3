// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RishiToken {
    string public token_name;
    string public token_symbol;
    uint256 public total_Supply;
    address public owner;

    mapping(address => uint256) public balance;

    event BurnToken(address indexed from, uint256 _amount);
    event TransferToken(
        address indexed from,
        address indexed to,
        uint256 _amount
    );

    constructor(
        string memory _Tname,
        string memory _Tsymbol,
        uint256 _Tsupply
    ) {
        owner = msg.sender;
        token_name = _Tname;
        token_symbol = _Tsymbol;
        total_Supply = _Tsupply;
        balance[msg.sender] = _Tsupply;
    }

    // Modifier to check if the caller is the contract owner
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "You are not the owner of the contract, only owner can access it..."
        );
        _;
    }

    function mint(address to, uint256 _amount) public onlyOwner {
        require(_amount > 0, "Your amount should be greater than 0...");
        require(to != address(0), "Invalid address of recipient.....");

        balance[to] += _amount;
        total_Supply += _amount;

        emit TransferToken(address(0), to, _amount);
    }

    function burn(uint256 _amount) public returns (bool) {
        require(_amount > 0, "Your amount should be greater than 0...");
        require(
            _amount <= balance[msg.sender],
            "Your balance is insufficient...."
        );

        balance[msg.sender] -= _amount;
        total_Supply -= _amount;

        emit BurnToken(msg.sender, _amount);
        return true;
    }

    function transfer(address to, uint256 _amount) public returns (bool) {
        require(_amount > 0, "Your amount should be greater than 0...");
        require(to != address(0), "Invalid address of recipient.....");
        require(
            _amount <= balance[msg.sender],
            "Your balance is insufficient...."
        );

        balance[msg.sender] -= _amount;
        balance[to] += _amount;

        emit TransferToken(msg.sender, to, _amount);
        return true;
    }
}
