// SPDX-License-Identifier: MIT

pragma solidity >=0.8.4;

contract DataTypes {
    // data types
    uint256 favNumber = 20;
    int256 favInteger = -1937;
    bool favourite = true;

    // string vs bytes
    string name = "Udit"; // use to store string dynamic size
    bytes32 public n = "more in later"; // use to store string but fixed legth

    // byte without the length stores binary data not readable string

    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    uint256[] favouriteNumbers = [1,2,43,43]; // array

}