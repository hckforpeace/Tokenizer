
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

//ERC Token Standard #20
interface ERC20 {

    // Methods
    // function name() public view returns (string); // name of the Token 
    // function symbol() public view returns (string);
    // function decimals() public view returns (uint8);
    function totalSupply() external view returns (uint256); // defines the total supply of Tokens (when this limit is reached the smart contract will refuse to generate more tokens)
    function balanceOf(address _owner) external view returns (uint256 balance); // returns the number of tokens for a given wallet address
    function transfer(address _to, uint256 _value) external returns (bool success); // transfer a certain amount of token to a certain address 
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success); // Transfer Tokens from a user to another
    function approve(address _spender, uint256 _value) external returns (bool success); // method that will define if the smart contract can allocate a certain amount of tokens to a certain user considering (totalSupply)  
    function allowance(address _owner, address _spender) external view returns (uint256 remaining); // tells if a speicific user has enough BALANCE to send to another user

    // Events
    event Transfer(address indexed _from, address indexed _to, uint256 _value); // is emited by transfer when a user sends a certain amount of tokens to another user
    event Approval(address indexed _owner, address indexed _spender, uint256 _value); // is emited by approve when a user approves a tarnsfer by a DEX (decentralized exchange) to trade on their behalf

}



// Just like in any Object oriented programming language can use the interface to define the methods that the contract will have
contract Token42 is ERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public _totalSupply;

    // a Dictionary key is of type (address) the value of type uint
    mapping(address => uint256) balances; // (Track and store the balance of each user)
    mapping(address => mapping(address => uint)) allowed; // nested map, it defines for each user (outer key) a map of addresses (inner key) that are wallets, and how much they are allowed to spend (inner value)

    // like in OOP this is the constructor it's called once when the smart contract is deployed
    constructor() {
        symbol="42TKN";
        name="42 Coin";
        decimals=18; // defines the smallest unit of a token the smallest is 1 / (10)^18
        _totalSupply = 1_000_001_000_000_000_000_000_000;
        balances[msg.sender] = _totalSupply;
        // balances[MY_BALANCE] = _totalSupply here I can put lots of money on my wallet 
    }

    // function name() public view returns (string) {
    //     return (name);
    // }

    // function symbol() public view returns (string) {
    //     return (symbol);
    // }

    // function decimals() public view returns (uint8) {
    //     return (decimals);
    // }

    function totalSupply() public view returns (uint256 balance) {
        return (_totalSupply);
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return (balances[_owner]);
    }


    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value, "Not enough balance");
        require(_to != address(0), "Cannot transfer to zero address");

        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        emit Transfer(msg.sender, _to, _value);
        return (true);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balances[_from] >= _value, "Not enough balance");
        require(allowed[_from][msg.sender] >= _value, "Allowance exceeded");

        balances[_from] -= _value;
        balances[_to] += _value;

        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return (true);
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return (allowed[_owner][_spender]);
    }

}