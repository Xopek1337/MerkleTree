const { MerkleTree } = require('merkletreejs');
const keccak256 = require('keccak256');

const whitelistAddress = [
  '0x9e6a2A5Ac4D55eE0952aC3c09e6144353DD3d8DE',
];

const leafNodes = whitelistAddress.map((addr) => keccak256(addr));
const merkleTree = new MerkleTree(leafNodes, keccak256, { sortPairs: true });
const rootHash = merkleTree.getRoot();

console.log('Whitelist Merkle Tree\n', merkleTree.toString());
console.log(rootHash.toString('hex'));
