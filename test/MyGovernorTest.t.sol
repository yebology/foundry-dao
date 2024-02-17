// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Test} from "forge-std/Test.sol";
import {MyGovernor} from "../src/MyGovernor.sol";
import {Box} from "../src/Box.sol";
import {GovToken} from "../src/GovToken.sol";
import {TimeLock} from "../src/TimeLock.sol";

contract MyGovernorTest is Test {
    // 
    MyGovernor governor;
    Box box;
    TimeLock timeLock;
    GovToken govToken;

    address public USER = makeAddr("user");
    address[] proposers;
    address[] executors;

    uint256 public constant INITIAL_SUPPLY = 100 ether;
    uint256 public constant MIN_DELAY = 3600;

    function setUp() public {
        govToken = new GovToken();
        govToken.mint(USER, INITIAL_SUPPLY);

        vm.startPrank(USER);
        govToken.delegate(USER);
        timeLock = new TimeLock(MIN_DELAY, proposers, executors);
        governor = new MyGovernor(govToken, timeLock);

        bytes32 proposerRole = timeLock.PROPOSER_ROLE();
        bytes32 executorRole = timeLock.EXECUTOR_ROLE();
        bytes32 adminRole = timeLock.TIMELOCK_ADMIN_ROLE();

        timeLock.grantRole(proposerRole, address(governor));
        timeLock.grantRole(executorRole, address(0)); // siapapun bisa execute proposal
        timeLock.revokeRole(adminRole, USER);
        vm.stopPrank();

        box = new Box();
        box.transferOwnership(address(timeLock));
    }

    function testCanUpdateBoxWithoutGovernance() public {
        vm.expectRevert();
        box.store(1);
    }

    function testGovernanceUpdatesBox() public {
        
    }
    // 
}