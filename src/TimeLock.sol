// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {TimelockController} from "lib/openzeppelin-contracts/contracts/governance/TimelockController.sol";

contract TimeLock is TimelockController {
    // 
    constructor(
        uint256 minDelay,
        address[] memory proposers,
        address[] memory executors
    ) TimelockController(minDelay, proposers, executors, msg.sender) {

    }
    //
}