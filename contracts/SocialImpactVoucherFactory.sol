//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import { SocialImpactVoucher } from "./SocialImpactVoucher.sol";

import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";


/**
 * @title - Social Impact Voucher Factory contract
 * @dev - This smart contract is in progress to build
 */
contract SocialImpactVoucherFactory {
    
    address[] public socialImpactVouchers;

    constructor() {
        //[TODO]: 
    }

    /**
     * @notice - Create a new SocialImpactVoucher contract
     */
    // function createNewSocialImpactVoucher(address marketRegistry, address unionToken, address token, address nonProfitOrganization, uint vouchAmount, IERC721 npoNFT) public {
    //     SocialImpactVoucher socialImpactVoucher = new SocialImpactVoucher(marketRegistry, unionToken, token, nonProfitOrganization, vouchAmount, npoNFT);
    //     address SOCIAL_IMPACT_VOUCHER = address(socialImpactVoucher);
    //     socialImpactVouchers.push(SOCIAL_IMPACT_VOUCHER);
    // }

}