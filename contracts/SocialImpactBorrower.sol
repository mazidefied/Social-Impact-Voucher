//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//@dev - OpenZeppelin
import { AccessControl } from "@openzeppelin/contracts/access/AccessControl.sol";
//import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

//@dev - Import the Union Finance V1 SDK contracts from union-v1-sdk
import { UnionBorrower } from "./union-v1-sdk/UnionBorrower.sol";
import { BaseUnionMember } from "./union-v1-sdk/BaseUnionMember.sol";

import { NpoNFT } from "./mock/NpoNFT.sol";
import { NpoNFTFactory } from "./mock/NpoNFTFactory.sol";


/**
 * @title - The Social Impact Borrower contract
 * @notice - A NPO member can borrow from credit line based on vouched-amount
 */ 
contract SocialImpactBorrower is AccessControl, UnionBorrower {

    NpoNFTFactory public npoNFTFactory;

    //@dev - Roles
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant NPO_MEMBER_ROLE = keccak256("NPO_MEMBER_ROLE");

    constructor(address marketRegistry, address unionToken, address token, address npoUser, NpoNFTFactory _npoNFTFactory) BaseUnionMember(marketRegistry,unionToken,token) {

        //@dev - Member NFTs
        npoNFTFactory = _npoNFTFactory;

        //@dev - Set roles
        _setupRole(ADMIN_ROLE, msg.sender);
        _setupRole(NPO_MEMBER_ROLE, npoUser);
    }


    /**
     * @notice - Become a member as a NPO (Borrower)
     * @dev - A NPO member receive a NPO-NFT
     */
    function registerMemberAsNPO() public {
        address newNpoMember = msg.sender;
        uint256 newMemberFee = userManager.newMemberFee();
        unionToken.transferFrom(newNpoMember, address(this), newMemberFee);
        _registerMember();

        //@dev - A NPO-NFT is created (minted) to a new NPO member's wallet address in the NpoNFTFactory contract
        //@dev - Then, A NPO-NFT is distributed into the NPO member's wallet address
        NpoNFT npoNFT = npoNFTFactory.createNewNpoNFT(newNpoMember);
    }

    function borrow(uint256 amount) public onlyRole(NPO_MEMBER_ROLE) {
        _borrow(amount);
        underlyingToken.transfer(msg.sender, amount);
    }

    function repayBorrow(uint256 amount) public onlyRole(NPO_MEMBER_ROLE) {
        underlyingToken.transferFrom(msg.sender, address(this), amount);
        _repayBorrow(amount);
    }

    function repayBorrowBehalf(address account, uint256 amount) public onlyRole(NPO_MEMBER_ROLE) {
        underlyingToken.transferFrom(msg.sender, address(this), amount);
        _repayBorrowBehalf(account, amount);
    }
    
    function mint(uint256 amount) public onlyRole(NPO_MEMBER_ROLE) {
        underlyingToken.transferFrom(msg.sender, address(this), amount);
        _mint(amount);
    }
    
    // sender redeems uTokens in exchange for the underlying asset
    function redeem(uint256 amount) public onlyRole(NPO_MEMBER_ROLE) {
        _redeem(amount);
        underlyingToken.transfer(msg.sender, underlyingToken.balanceOf(address(this)));
    }

    // sender redeems uTokens in exchange for a specified amount of underlying asset
    function redeemUnderlying(uint256 amount) public onlyRole(NPO_MEMBER_ROLE) {
        _redeemUnderlying(amount);
        underlyingToken.transfer(msg.sender, underlyingToken.balanceOf(address(this)));
    }

}