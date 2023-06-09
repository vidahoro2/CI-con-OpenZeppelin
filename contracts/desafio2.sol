// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Desafio2 is ERC20Burnable,Pausable,Ownable{

    constructor() ERC20Burnable() ERC20("Desafio 2","DSF"){
        _mint(msg.sender,1000);
    }
    
    function Pausar() public onlyOwner{
        _pause();
    }

    function Despausar() public onlyOwner{
        _unpause();
    }

    function Quemar(uint cantidad) public{
        require(paused()!= true,"El contrato esta pausado");
        burn(cantidad);
    }



}