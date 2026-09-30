// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import{Fallback} from "../src/fallback.sol";

contract deployScript is Script{
    function run() public returns(Fallback){
        vm.startBroadcast();
        Fallback fallback = new Fallback();
        vm.stopBroadcast();
        return fallback;
    }
}