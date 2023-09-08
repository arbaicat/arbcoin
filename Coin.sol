// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public total;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    constructor() {
        name = "ArbAICAT";
        symbol = "AICAT";
        decimals = 18;
        total = 1500000000000000000000000000000;
        balances[msg.sender] = total;
        emit Transfer(address(0), msg.sender, total);}
    function totalSupply() public view returns (uint) {
        return total;}
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];}
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;}
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender] - tokens;
        balances[to] = balances[to] + tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;}
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from] - tokens;
        allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
        balances[to] = balances[to] + tokens;
        emit Transfer(from, to, tokens);
        return true;}
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);}