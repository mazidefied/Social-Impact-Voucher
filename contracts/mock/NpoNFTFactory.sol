//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import { NpoNFT } from "./NpoNFT.sol";

import { INpoNFT } from "../interfaces/INpoNFT.sol";
import { INpoNFTFactory } from "../interfaces/INpoNFTFactory.sol";

import { Events } from "../libraries/Events.sol";


/**
 * @title - The factory contract for creating NPO NFTs
 */ 
contract NpoNFTFactory is INpoNFTFactory { 

    address[] public npoNFTs;
    mapping (address => address) npoNFTHolders;  // [Key]: Account address -> NpoNFT contract address

    constructor() {
        //[TODO]: 
    }

    function createNewNpoNFT(address npoMember) public override returns (NpoNFT _npoNFT) {
        NpoNFT npoNFT = new NpoNFT(npoMember);
        npoNFTs.push(address(npoNFT));
        npoNFTHolders[npoMember] = address(npoNFT);

        emit Events.NpoNFTCreated(npoNFT);

        return npoNFT;
    }

    function getNpoNFTHolder(address npoMember) public override returns (address _npoNFTHolder) {
        return npoNFTHolders[npoMember];
    }

}