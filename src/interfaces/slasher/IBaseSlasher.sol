// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.25;

interface IBaseSlasher {
    error NotNetworkMiddleware();
    error NetworkNotOptedInVault();
    error NotVault();
    error OperatorNotOptedInNetwork();
    error OperatorNotOptedInVault();

    /**
     * @notice Get the vault factory's address.
     * @return address of the vault factory
     */
    function VAULT_FACTORY() external view returns (address);

    /**
     * @notice Get the network middleware service's address.
     * @return address of the network middleware service
     */
    function NETWORK_MIDDLEWARE_SERVICE() external view returns (address);

    /**
     * @notice Get the network-vault opt-in service's address.
     * @return address of the network-vault opt-in service
     */
    function NETWORK_VAULT_OPT_IN_SERVICE() external view returns (address);

    /**
     * @notice Get the operator-vault opt-in service's address.
     * @return address of the operator-vault opt-in service
     */
    function OPERATOR_VAULT_OPT_IN_SERVICE() external view returns (address);

    /**
     * @notice Get the operator-network opt-in service's address.
     * @return address of the operator-network opt-in service
     */
    function OPERATOR_NETWORK_OPT_IN_SERVICE() external view returns (address);

    /**
     * @notice Get the vault's address.
     * @return address of the vault to perform slashings on
     */
    function vault() external view returns (address);

    /**
     * @notice Get the cumulative slash amount for an operator on a network until a given timestamp (inclusively).
     * @param network address of the network
     * @param operator address of the operator
     * @param timestamp time point to get the cumulative slash amount until (inclusively)
     * @return cumulative slash amount until the given timestamp (inclusively)
     */
    function cumulativeSlashAt(address network, address operator, uint48 timestamp) external view returns (uint256);

    /**
     * @notice Get the cumulative slash amount for an operator on a network.
     * @param network address of the network
     * @param operator address of the operator
     * @return cumulative slash amount
     */
    function cumulativeSlash(address network, address operator) external view returns (uint256);

    /**
     * @notice Get the slash amount for an operator on a network during a given time period.
     * @param network address of the network
     * @param operator address of the operator
     * @param timestamp time point to start the time period (exclusively)
     * @param duration duration of the time period
     * @return slash amount during the given time period
     * @dev The time period is (timestamp, timestamp + duration].
     */
    function slashAtDuring(
        address network,
        address operator,
        uint48 timestamp,
        uint48 duration
    ) external view returns (uint256);
}
