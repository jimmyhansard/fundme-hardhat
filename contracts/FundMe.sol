// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

error NotOwner();

contract FundMe {
    address public owner;
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        addressToAmountFunded[msg.sender] = msg.value;
        funders.push(msg.sender);
    }

    modifier ownerOnly() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    function withdraw() public ownerOnly {}
}
