// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Mars is Initializable, ERC20Upgradeable, UUPSUpgradeable, OwnableUpgradeable {
    //initializer is a modifier which allows this function to run only once
    function initialize() public initializer {
        __ERC20_init("Mars", "MARS");
        __Ownable_init();
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {

    }
}