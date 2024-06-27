// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

interface ISlasher {
    error InsufficientSlash();

    struct InitParams {
        address vault;
    }

    /**
     * @notice Emitted when a slash request is created.
     * @param network network that requested the slash
     * @param operator operator that could be slashed (if the request is not vetoed)
     * @param slashedAmount .
     */
    event Slash(address indexed network, address indexed operator, uint256 slashedAmount);

    /**
     * @notice Perform a slash using a network for a particular operator by a given amount.
     * @param network address of the network
     * @param operator address of the operator
     * @param amount maximum amount of the collateral to be slashed
     * @return slashedAmount amount of the collateral slashed
     * @dev Only network middleware can call this function.
     */
    function slash(address network, address operator, uint256 amount) external returns (uint256 slashedAmount);
}