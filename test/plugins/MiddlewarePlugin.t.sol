// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Test, console2} from "forge-std/Test.sol";

import {NonMigratablesRegistry} from "src/contracts/NonMigratablesRegistry.sol";
import {IPlugin} from "src/interfaces/IPlugin.sol";

import {MiddlewarePlugin} from "src/contracts/plugins/MiddlewarePlugin.sol";
import {IMiddlewarePlugin} from "src/interfaces/plugins/IMiddlewarePlugin.sol";

contract MiddlewarePluginTest is Test {
    address owner;
    address alice;
    uint256 alicePrivateKey;
    address bob;
    uint256 bobPrivateKey;

    NonMigratablesRegistry registry;

    IMiddlewarePlugin plugin;

    function setUp() public {
        owner = address(this);
        (alice, alicePrivateKey) = makeAddrAndKey("alice");
        (bob, bobPrivateKey) = makeAddrAndKey("bob");

        registry = new NonMigratablesRegistry();
    }

    function test_Create(address middleware) public {
        plugin = IMiddlewarePlugin(address(new MiddlewarePlugin(address(registry))));

        assertEq(plugin.middleware(alice), address(0));

        vm.startPrank(alice);
        registry.register();
        vm.stopPrank();

        vm.startPrank(alice);
        plugin.setMiddleware(middleware);
        vm.stopPrank();

        assertEq(plugin.middleware(alice), middleware);
    }

    function test_SetNumberRevertNotEntity(address middleware) public {
        plugin = IMiddlewarePlugin(address(new MiddlewarePlugin(address(registry))));

        vm.startPrank(alice);
        vm.expectRevert(IPlugin.NotEntity.selector);
        plugin.setMiddleware(middleware);
        vm.stopPrank();
    }
}