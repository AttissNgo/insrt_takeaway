// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Genome {
    
    struct Attributes {
        uint8 backgroundColor;
        uint8 backgroundEffect;
        uint8 wings;
        uint8 skinPattern;
        uint8 body;
        uint8 mouth;
        uint8 eyes;
        uint8 skinColor;
        uint8 hat;
        uint8 pet;
        uint8 accessory;
        uint8 border;
    }

    uint8 public constant BACKGROUND_COLOR_MAX = 60;
    uint8 public constant BACKGROUND_EFFECT_MAX = 60;
    uint8 public constant WINGS_MAX = 10;
    uint8 public constant SKIN_PATTERN_MAX = 10;
    uint8 public constant BODY_MAX = 100;
    uint8 public constant MOUTH_MAX = 50;
    uint8 public constant EYES_MAX = 60;
    uint8 public constant SKIN_COLOR_MAX = 40;
    uint8 public constant HAT_MAX = 100;
    uint8 public constant PET_MAX = 10;
    uint8 public constant ACCESSORY_MAX = 25;
    uint8 public constant BORDER_MAX = 30;

    uint256 public immutable SEED;

    error InvalidTokenId();

    constructor(uint256 _seed) {
        SEED = _seed;
    }

    function tokenAttributes(uint256 tokenId) public view returns (Attributes memory attributes) {
        if (tokenId < 1 || tokenId > 5000) revert InvalidTokenId();
        uint256 packedValue = uint256(keccak256(abi.encodePacked(tokenId, SEED)));
        attributes = _unpackAttributes(packedValue);
        attributes.backgroundColor = _adjustValue(attributes.backgroundColor, BACKGROUND_COLOR_MAX);
        attributes.backgroundEffect = _adjustValue(attributes.backgroundEffect, BACKGROUND_EFFECT_MAX);
        attributes.wings = _adjustValue(attributes.wings, WINGS_MAX);
        attributes.skinPattern = _adjustValue(attributes.skinPattern, SKIN_PATTERN_MAX);
        attributes.body = _adjustValue(attributes.body, BODY_MAX);
        attributes.mouth = _adjustValue(attributes.mouth, MOUTH_MAX);
        attributes.eyes = _adjustValue(attributes.eyes, EYES_MAX);
        attributes.skinColor = _adjustValue(attributes.skinColor, SKIN_COLOR_MAX);
        attributes.hat = _adjustValue(attributes.hat, HAT_MAX);
        attributes.pet = _adjustValue(attributes.pet, PET_MAX);
        attributes.accessory = _adjustValue(attributes.accessory, ACCESSORY_MAX);
        attributes.border = _adjustValue(attributes.border, BORDER_MAX);
    }

    function _unpackAttributes(uint256 packed) internal pure returns (Attributes memory) {
        Attributes memory attributes;
        attributes.backgroundColor = uint8(packed >> 240);
        attributes.backgroundEffect = uint8(packed >> 232);
        attributes.wings = uint8(packed >> 224);
        attributes.skinPattern = uint8(packed >> 216);
        attributes.body = uint8(packed >> 208);
        attributes.mouth = uint8(packed >> 200);
        attributes.eyes = uint8(packed >> 192);
        attributes.skinColor = uint8(packed >> 184);
        attributes.hat = uint8(packed >> 176);
        attributes.pet = uint8(packed >> 168);
        attributes.accessory = uint8(packed >> 160);
        attributes.border = uint8(packed >> 152);
        return attributes;
    }

    function _adjustValue(uint8 value, uint8 max) internal pure returns (uint8) {
        if (value <= max) return value;
        else return value % (max + 1);
    }

}
