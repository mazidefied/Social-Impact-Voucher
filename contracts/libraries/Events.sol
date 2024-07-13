// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import { DataTypes } from './DataTypes.sol';

import { NpoNFT } from '../mock/NpoNFT.sol';


library Events {

    event NpoNFTCreated(
        NpoNFT npoNFT
    );

}
