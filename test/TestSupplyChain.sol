// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

    address a = DeployedAddresses.SupplyChain();
    bool success;
    SupplyChain sc;

    function beforeEach() public {
        sc = SupplyChain(a);
        sc.addItem("first", 100);
        sc.addItem("second", 100);
    }

    // Test for failing conditions in this contracts:
    // https://truffleframework.com/tutorials/testing-for-throws-in-solidity-tests

    function testBuyItem() public {
        // buyItem

        // test for failure if user does not send enough funds
        (success, ) = address(a).call{ value: 40 }(abi.encodePacked(sc.buyItem.selector));
        Assert.isFalse(success, "Should throw when not enough funds are sent");
        // test for purchasing an item that is not for Sale

        // shipItem

        // test for calls that are made by not the seller
        // test for trying to ship an item that is not marked Sold

        // receiveItem

        // test calling the function from an address that is not the buyer
        // test calling the function on an item not marked Shipped
    }
}
