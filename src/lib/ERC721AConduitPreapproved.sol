// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import { ERC721A } from "https://github.com/chiru-labs/ERC721A/blob/9be81f029a0883e0c7c6d5a410ee49c48c69205d/contracts/ERC721A.sol";

/**
 * @title  ERC721AConduitPreapproved
 * @notice ERC721A with the OpenSea conduit preapproved.
 */
abstract contract ERC721AConduitPreapproved is ERC721A {
    /// @dev The canonical OpenSea conduit.
    address internal constant _CONDUIT =
        0xDef1C0ded9bec7F1a1670819833240f027b25EfF;

    /**
     * @notice Deploy the token contract.
     *
     * @param name              The name of the token.
     * @param symbol            The symbol of the token.
     */
    constructor(
        string memory name,
        string memory symbol
    ) ERC721A(name, symbol) {}

    /**
     * @dev Returns if the `operator` is allowed to manage all of the
     *      assets of `owner`. Always returns true for the conduit.
     */
    function isApprovedForAll(
        address owner,
        address operator
    ) public view virtual override returns (bool) {
        if (operator == _CONDUIT) {
            return true;
        }
        return ERC721A.isApprovedForAll(owner, operator);
    }
}
