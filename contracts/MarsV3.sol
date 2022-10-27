// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Mars.sol";

contract MarsV3 is Mars {

    uint fee;
    uint tax;
    
    function version() pure public returns(string memory) {
        return "V3!";
    }

    function setTax(uint _tax) external onlyOwner {
        tax = _tax;
    }

    function getTax() external view returns(uint) {
        return tax;
    }
}