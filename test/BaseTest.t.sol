// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Genome} from "src/Genome.sol";

contract BaseTest is Test {

    Genome public genome;

    uint256 public constant SEED = 20537091100315528740606659648069392331019367734366926643103679361967052349730;

    function setUp() public {
        genome = new Genome(SEED);
    }

    function test_tokenAttributes() public view {
        Genome.Attributes memory attr = genome.tokenAttributes(1);
        console.log("backgroundColor: ", attr.backgroundColor);
        console.log("backgroundEffect: ", attr.backgroundEffect);
        console.log("wings: ", attr.wings);
        console.log("skinPattern: ", attr.skinPattern);
        console.log("body: ", attr.body);
        console.log("mouth: ", attr.mouth);
        console.log("eyes: ", attr.eyes);
        console.log("skinColor: ", attr.skinColor);
        console.log("hat: ", attr.hat);
        console.log("pet: ", attr.pet);
        console.log("accessory: ", attr.accessory);
        console.log("border: ", attr.border);
    }
    
}
