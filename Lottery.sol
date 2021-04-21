pragma solidity ^0.8.0;


contract Lottery {
    address[] public players;
    address public manager;

    constructor()  {
        manager = msg.sender;
    }

    receive () payable external {

        require(msg.value >= 0.01 ether, "Not enough funds");
        players.push(msg.sender);
    }

    function get_balance() public view returns(uint) {
        require(msg.sender == manager);
        return address(this).balance;
    }

}