// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
import {SimpleStorage} from "../Module 1 Simple Storage/SimpleStorage.sol";

contract StorageFactory {
    // storagefactory will create and deploy new contract (simplestorage)

    SimpleStorage public simpleStorage; // SimpleStorage type variable
    // this will basically return the contract address after deploying

    function createContract() public {
        simpleStorage = new SimpleStorage(); 
        // this will deploy the new contract
    }
} 