pragma solidity ^0.8.0;


contract Lottery {
    address[] public players;
    address public manager;

    constructor()  {
        manager = msg.sender;
    }

    receive () payable external {

        players.push(msg.sender);
    }

    function get_balance() public view returns(uint) {
        return address(this).balance;
    }

}