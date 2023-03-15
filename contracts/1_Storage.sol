// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract Storage is AccessControl {



    uint256 number;
    bytes32 ROL_ADMIN = keccak256("ROL_ADMIN");
    bytes32 ROL_WRITER = keccak256("ROL_WRITER");

    constructor(){
        _grantRole(ROL_ADMIN,msg.sender);
    }


    modifier  onlyWriter(){
        require(hasRole(ROL_WRITER,msg.sender),"Solo el writer puede acceder a esta funcion");
        _;
        
    }

    modifier onlyOwner(){
        require(hasRole(ROL_ADMIN,msg.sender),"Solo el admin puede acceder a esta funcion");
        _;
    }
    function AgregarWriter(address cuenta) public onlyOwner{
        _grantRole(ROL_WRITER,cuenta);
    }

    function QuitarWriter(address cuenta) public onlyOwner{
        _revokeRole(ROL_WRITER,cuenta);
    }

    
    function store(uint256 num) public onlyWriter{
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}