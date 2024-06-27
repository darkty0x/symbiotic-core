// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IRegistry} from "./IRegistry.sol";

interface IMigratablesFactory is IRegistry {
    error AlreadyWhitelisted();
    error InvalidVersion();
    error NotOwner();
    error OldVersion();

    /**
     * @notice Get the last available version.
     * @return version of the last implementation
     * @dev If zero, no implementations are whitelisted.
     */
    function lastVersion() external view returns (uint64);

    /**
     * @notice Get the implementation for a given version.
     * @param version version to get the implementation for
     * @return address of the implementation
     * @dev Reverts when an invalid version.
     */
    function implementation(uint64 version) external view returns (address);

    /**
     * @notice Whitelist a new implementation for entities.
     * @param implementation address of the new implementation
     */
    function whitelist(address implementation) external;

    /**
     * @notice Create a new entity at the registry.
     * @param version entity's version to use
     * @param owner initial owner of the entity
     * @param data initial data for the entity creation
     * @return address of the entity
     */
    function create(uint64 version, address owner, bytes memory data) external returns (address);

    /**
     * @notice Migrate a given entity to a given newer version.
     * @param entity address of the entity to migrate
     * @param newVersion new version to migrate to
     * @param data some data to reinitialize the contract with
     * @dev Only the entity's owner can call this function.
     */
    function migrate(address entity, uint64 newVersion, bytes memory data) external;
}