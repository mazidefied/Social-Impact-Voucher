//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import { SocialImpactBorrower } from "./SocialImpactBorrower.sol";

import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";


/**
 * @title - Social Impact Voucher Factory contract
 * @dev - This smart contract is in progress to build
 */
contract SocialImpactBorrowerFactory {
    
    address[] public socialImpactBorrowers;

    constructor() {
        //[TODO]: 
    }

    /**
     * @notice - Create a new SocialImpactBorrower contract
     */
    // function createNewSocialImpactBorrower() public {}

}