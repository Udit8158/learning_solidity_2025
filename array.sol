// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Practice {
    uint256[] public arr = [0,1,2,3];
    uint256 public length = arr.length;
    
    function test () public{
    // arr[arr.length - 1] = 1; // 0,1,2,1
    arr[1] = arr[arr.length - 1]; // 0,3,2,3
    }

    function remove(uint256 _index) public{
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }
}