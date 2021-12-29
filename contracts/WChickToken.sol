//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

import "./token/behaviours/ERC20Mintable.sol";

contract WChickToken is ERC20Burnable, ERC20Mintable, Ownable {
    constructor(string memory name, string memory symbol, uint256 initialBalance) ERC20(name, symbol) {
        require(initialBalance > 0, "wChick: Supply cannot be zero");
        _mint(msg.sender, initialBalance * (10 ** decimals()));
    }

    function _mint(address account, uint256 amount) internal override onlyOwner {
        super._mint(account, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 9;
    }

    function migrate(address recipient, uint256 amount, uint nonce) public returns (bool) {
        require(nonce > 0, "Nonce is required");
        return transfer(recipient, amount);
    }
}