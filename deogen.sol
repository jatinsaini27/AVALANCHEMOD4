// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    constructor() ERC20("DegenGaming", "DMT") {
    }

    function mintingTokens(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function checkBalance() external view returns(uint)
    {
        return this.balanceOf(msg.sender);
    }


    function transfer(address reciever, uint256 amount) public override returns(bool) {

        _transfer(msg.sender, reciever, amount);
        return true;
    }

    function transferFrom(address sender,address reciever,uint256 amount) public override returns(bool) {
        _transfer(sender, reciever, amount);
        _approve(sender, reciever, amount);
        return true;
    }

    function redeemStationaryitems(uint256 input) external payable returns(bool)
    {
        require(input<4&&input>0,"You have entered wrong input");
        if(input==1)
        {
            require(this.balanceOf(msg.sender)>=60,"notebook cannot be purchased because of insufficient balance");
            approve(msg.sender,60);
            transferFrom(msg.sender,owner(),60);
            return true;
        }
        else if(input==2)
        {
            require(this.balanceOf(msg.sender)>=25,"eraser cannot be purchased because of insufficient balance");
            approve(msg.sender,25);
            transferFrom(msg.sender,owner(),25);
            return true;

        }
        else 
        {
            require(this.balanceOf(msg.sender)>=10,"pencil cannot happen because of insufficient balance");
            approve(msg.sender,10);
            transferFrom(msg.sender,owner(),10);
            return true;
        }
    }
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}

