//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "../libraries/LibERC721.sol";
import "../libraries/AppStorage.sol";
import "../libraries/LibDiamond.sol";
import "../libraries/LibStrings.sol";
import "../interfaces/IERC1155.sol";

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ERC721 is LibERC721{

    function BalanceOf(address owner) external view returns(uint256) {
        return balanceOf(owner);
    }
    
    function OwnerOf(uint256 tokenID) external view returns(address){
        return ownerOf(tokenID);
    }
    function SafeTransferFrom(address from, address to, uint256 tokenID) external {
        safeTransferFrom(from, to, tokenID);
    }

    function NFTbyWithTickets(address ticketAddress, address buyer, address seller, uint256 nftId, uint256 tokenType, uint256 ticketsAmount) external{
        IERC1155(ticketAddress).safeTransferFrom(buyer, seller, tokenType,ticketsAmount, "");
        safeTransferFrom(seller, buyer, nftId);
    }

    function TransferFrom(address from, address to, uint256 tokenID) external {
        transferFrom(from, to, tokenID);
    }

    function Approve(address to, uint256 tokenID) external{
        approve(to, tokenID);
    }
    function GetApproved(uint256 tokenId) external view returns(address) {
        return getApproved(tokenId);
    }
    function SetApprovalForAll(address operator, bool _approved) external {
        setApprovalForAll(operator, _approved);
    }
    function IsApprovedForAll(address owner, address operator) external view returns(bool) {
        return isApprovedForAll(owner, operator);
    }
    function SafeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external {
        safeTransferFrom(from, to, tokenId, data);
    }
    function transfer(address from, address to, uint256 tokenID) external {
        _transfer(from, to, tokenID);
    }
    
}
