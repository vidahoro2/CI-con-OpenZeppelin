// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MiTokenFungible is ERC20("Mi Token Fungible","MFT"){

    constructor(){
        _mint(msg.sender, 1000);
    }
}