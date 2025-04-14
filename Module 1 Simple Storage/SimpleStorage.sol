// SPDX-License-Identifier: MIT

pragma solidity >=0.8.4;

contract SimpleStorage {
    // create my own type - something like class
    struct Person{
        string name;
        uint256 favoriteNumber;
    }
    Person[] public personList;   

    // storing favourite number of persons
    function store(uint256 _number, string memory _name) public{
        // personList.push(Person(_name, _number));

        // using mapping instead of list and structure
        nameToFavNumber[_name] = _number;
    }

    // retrieve the objects of personlist (same as the public variable)
    // function retrieve(uint256 _index) public view returns(Person memory) {
    //     return personList[_index];
    // }

    // using mapping
    function retrieve(string memory _name) public view returns(uint256) {
        return nameToFavNumber[_name];
    }

    // if I want to see the favourite number of specific person
    // like I will give "personname" innput and expect the favourite number as output

    // like mapping

    mapping (string => uint256) public nameToFavNumber;
}