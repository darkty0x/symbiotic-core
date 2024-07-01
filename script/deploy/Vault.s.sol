// // SPDX-License-Identifier: UNLICENSED
// pragma solidity 0.8.25;

// import "forge-std/Script.sol";

// import {IMigratablesFactory} from "src/interfaces/base/IMigratablesFactory.sol";
// import {IVault} from "src/interfaces/vault/IVault.sol";

// contract VaultScript is Script {
//     function run(
//         address vaultFactory,
//         address owner,
//         address collateral,
//         uint48 epochDuration,
//         uint48 vetoDuration,
//         uint48 executeDuration,
//         address stakerRewardsDistributor,
//         uint256 adminFee,
//         bool depositWhitelist
//     ) public {
//         vm.startBroadcast();

//         IMigratablesFactory(vaultFactory).create(
//             IMigratablesFactory(vaultFactory).lastVersion(),
//             owner,
//             abi.encode(
//                 IVault.InitParams({
//                     collateral: collateral,
//                     epochDuration: epochDuration,
//                     vetoDuration: vetoDuration,
//                     executeDuration: executeDuration,
//                     stakerRewardsDistributor: stakerRewardsDistributor,
//                     adminFee: adminFee,
//                     depositWhitelist: depositWhitelist
//                 })
//             )
//         );

//         vm.stopBroadcast();
//     }
// }
