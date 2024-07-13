//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//@dev - OpenZeppelin
import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

import { INpoNFT } from "../interfaces/INpoNFT.sol";


/**
 * @title - The NPO NFT contract
 */ 
contract NpoNFT is INpoNFT, ERC721, Ownable {

    constructor(address npoMember) ERC721("NPO NFT", "NPO_NFT") {
        address to = npoMember;  // [NOTE]: msg.sender is a NPO member's wallet address
        uint256 tokenId = 0; 
        _safeMint(to, tokenId);
    }

    // function safeMint(address to, uint256 tokenId) public onlyOwner {
    //     _safeMint(to, tokenId);
    // }

}