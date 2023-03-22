// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/instrospection/ERC165.sol";


contract MiTokenFungible is ERC20("Mi Token Fungible","MFT"){

    constructor(){
        _mint(msg.sender, 1000);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165) returns (bool){
        return
            interfaceId == type(IERC20).interfaceId ||
            super.supportsInterface(interfaceId);
    }
}