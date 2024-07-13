// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/**
 * @title DataTypes
 */
library DataTypes {

    /**
     * @notice - Data of example
     */ 
    struct SomethingStruct {
        address addr;
        uint256 number; 
    }

    /**
     * @notice - Enum of example
     */ 
    enum SomethingType {
        TYPE_1,
        TYPE_2,
        TYPE_3
    }

}