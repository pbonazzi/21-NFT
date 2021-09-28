//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//contains the implementation of the ERC-721 standard
//https://eips.ethereum.org/EIPS/eip-721

import "@openzeppelin/contracts/utils/Counters.sol";
// provides counters that can only be incremented or decremented by one.

import "@openzeppelin/contracts/access/Ownable.sol";
//sets up access control on our smart contract, so only the owner of the smart contract (you) can mint NFTs.
//https://docs.openzeppelin.com/contracts/3.x/access-control

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("MyNFT", "CN") {}

    function mintNFT(address recipient, string memory tokenURI)
        public
        /* This function allows us to mint an NFT or 
        publish a unique instance of your ERC-721 token on the blockchain.

        PARAMETERS
            - address recipient : the address that will receive your freshly minted NFT
            - string memory tokenURI : string --> resolve to a JSON document --> describes the NFT's metadata.
        RETURN
            - newItemId : uint256 that represents the ID of the freshly minted NFT.
            
    */

        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
