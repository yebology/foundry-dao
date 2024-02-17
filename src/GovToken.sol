// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Votes} from "lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract GovToken is ERC20, ERC20Permit, ERC20Votes {
    constructor() ERC20("GovToken", "MTK") ERC20Permit("GovToken") {}

    function mint(
        address _to,
        uint256 _amount
    ) public {
        _mint(_to, _amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Votes)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        virtual
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}
