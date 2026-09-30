// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {deployScript} from "../script/Deploy.s.sol";
import {Fallback} from "../src/fallback.sol";

contract testing is Test{
    function setUp() public{
deployScript deployContract = new deployScript();

    }
}