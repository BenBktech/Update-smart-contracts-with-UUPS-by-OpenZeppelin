// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Mars.sol";

contract MarsV2 is Mars {

    uint fee;
    
    function version() pure public returns(string memory) {
        return "V2!";
    }
}