// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract XenniumToken is ERC20, Ownable, ERC20Permit {
    uint256 private constant TOTAL_SUPPLY = 19_000_000_000 * 10**18; // 19 billion tokens MAX SUPPLY
    uint256 private constant COMMUNITY_RESERVE = 3_000_000_000 * 10**18; // 3 billion tokens reserved for the community
    uint256 private constant DEVELOPMENT_RESERVE = 1_000_000_000 * 10**18; // 1 billion tokens reserved for development

    constructor() 
        ERC20("Xennium", "XENX") 
        ERC20Permit("Xennium") 
        Ownable(msg.sender) 
    {
        // Mint the total supply to the contract
        _mint(address(this), TOTAL_SUPPLY);

        // Transfer the development reserve to the owner's wallet
        _transfer(address(this), msg.sender, DEVELOPMENT_RESERVE);
    }

    // Last Coin Transfer Restriction (LCTR) Principle
    function _safeTransferCheck(address from, uint256 amount) internal view {
        require(balanceOf(from) - amount >= 1, "XENX: Cannot spend the last coin");
    }

    // Override transfer with LCTR check
    function transfer(address to, uint256 amount) public override returns (bool) {
        _safeTransferCheck(msg.sender, amount);
        return super.transfer(to, amount);
    }

    // Override transferFrom with LCTR check
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        _safeTransferCheck(from, amount);
        return super.transferFrom(from, to, amount);
    }

    // Community token allocation getter (view-only function)
    function communityReserve() external pure returns (uint256) {
        return COMMUNITY_RESERVE;
    }
}
