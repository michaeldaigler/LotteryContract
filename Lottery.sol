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

    function find_winner() public view returns(address){
        require(msg.sender == manager);
        uint r = random();
        address  winner;
        winner = players[r % players.length];
        return winner;

    }

    function get_balance() public view returns(uint) {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() private view returns(uint256) {
        return uint256(keccak256(abi.encode(block.difficulty, block.timestamp, players.length)));
    }

}