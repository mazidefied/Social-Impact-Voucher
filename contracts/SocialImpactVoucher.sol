//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//@dev - OpenZeppelin
import { AccessControl } from "@openzeppelin/contracts/access/AccessControl.sol";
//import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

//@dev - Import the Union Finance V1 SDK contracts from union-v1-sdk
import { UnionVoucher } from "./union-v1-sdk/UnionVoucher.sol";
import { UnionBorrower } from "./union-v1-sdk/UnionBorrower.sol";
import { BaseUnionMember } from "./union-v1-sdk/BaseUnionMember.sol";

import { NpoNFT } from "./mock/NpoNFT.sol";
import { NpoNFTFactory } from "./mock/NpoNFTFactory.sol";


/**
 * @title - Social Impact Voucher contract
 * @notice - A UnionMember that vouches for holders of membership NFTs
 */ 
contract SocialImpactVoucher is AccessControl, UnionVoucher, UnionBorrower {

    uint256 public vouchAmount;

    NpoNFTFactory public npoNFTFactory;

    //@dev - Roles
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant SUPPORTER_MEMBER_ROLE = keccak256("SUPPORTER_MEMBER_ROLE");

    /**
     *  @notice - Constructor
     *  @param marketRegistry - Union's MarketRegistry contract address
     *  @param unionToken - UNION token address
     *  @param token - Underlying asset address
     */ 
    constructor(address marketRegistry, address unionToken, address token, address supporterUser, uint _vouchAmount, NpoNFTFactory _npoNFTFactory) BaseUnionMember(marketRegistry, unionToken, token) {
        //@dev - Member NFTs
        vouchAmount = _vouchAmount;
        npoNFTFactory = _npoNFTFactory;

        //@dev - Set roles
        _setupRole(ADMIN_ROLE, msg.sender);
        _setupRole(SUPPORTER_MEMBER_ROLE, supporterUser);
    }

    /**
     * @notice - Become a member as a Supporter (Voucher)
     */ 
    function registerMemberAsSupporter() public {
        address newSupporterMember = msg.sender;
        uint256 newMemberFee = userManager.newMemberFee();
        unionToken.transferFrom(newSupporterMember, address(this), newMemberFee);
        _registerMember();
    }


    ///-------------------------------------
    /// Methods to vouch
    ///-------------------------------------

    //@dev - Only a NPO that holder a NPO-NFT can be vouched
    function vouchForNpoNFTHolder(address holder) public onlyRole(SUPPORTER_MEMBER_ROLE) {
        NpoNFT npoNFT = NpoNFT(npoNFTFactory.getNpoNFTHolder(holder));
        require(npoNFT.balanceOf(holder) > 0, "!holder");
        _updateTrust(holder, vouchAmount);
    }

    //@dev - Stop vouch for other member
    function cancelVouch(address staker, address borrower) public onlyRole(SUPPORTER_MEMBER_ROLE) {
        _cancelVouch(staker, borrower);
    }

    function stake(uint256 amount) public {
        underlyingToken.transferFrom(msg.sender, address(this), amount);
        _stake(amount);
    }

    function unstake(uint256 amount) public {
        _unstake(amount);
        underlyingToken.transfer(msg.sender, amount);
    }

    function withdrawRewards() public {
        _withdrawRewards();
        unionToken.transfer(msg.sender, unionToken.balanceOf(address(this)));
    }
    
    function debtWriteOff(address borrower, uint256 amount) public {
        _debtWriteOff(borrower, amount);
    }

}