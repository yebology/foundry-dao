// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

abstract contract Box is Ownable {
    // 
    uint256 private s_number;

    event numberChanged(uint256 number);

    function store(uint256 _newNumber) public onlyOwner {
        s_number = _newNumber;
        emit numberChanged(_newNumber);
    }

    function getNumber() external view returns (uint256) {
        return s_number;
    }


    //
}