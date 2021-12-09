//SPDX-License-Identifier: Unlicense

pragma solidity 0.8.10;

import "contracts/MerkleProofOZ.sol";

contract Merkle {
    bytes32 public merkleRoot = 0x16c94bc6a787d76f33ef30a6a023d5bae56b4e69987dcab3fa600b881d24691e;

    mapping(address => bool) public whilelistClaimed;

    function whilelistMint(bytes32[] calldata _merkleProof) public {
        require(whilelistClaimed[msg.sender], "Address has already claimed");

        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(MerkleProof.verify(_merkleProof, merkleRoot, leaf), "Invalid Proof");

        whilelistClaimed[msg.sender] = true;
    }
    function isClaimed(address addr) external view returns (bool) {
        return whilelistClaimed[addr];
    }
}