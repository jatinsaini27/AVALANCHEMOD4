# ERC20 Token for DEGEN GAMING

In this project, we have to create a ERC20 contract and deploy it on the avalanche network for Degen Gaming. This contract will have the functionality of minting tokens, checking the balnace, transferring the tokens, redeeming tokens and burning tokens. After deploying it on the avalanche network check the functionality of these on https://testnet.snowtrace.io/address/0x67eA8EEAee6442F8542e51017d7aE6e2D94CBdf0.

## Description

Firstly, we will create  a ERC20 contract. For this firstly use pragma which is a compiler directive which tells about the solidity version to be used. Then using installing open zeppelin and importing it from the Github so that we can use different functionality available under open zeppelin. Then create a constructor for Degen Gaming. After that create  a function of minting which will take two parameters address and the amount and also use the modifier so that only the owner will be able to mint tokens. Then create a function for checking the balance present in the account of the sender. Then create a function transfer for transferring the tokens from the account of the sender to the reciever. Then creating function redeem for redeeming the stationary items and it takes only one parameter and also uses the require statement for the purpose of error handling. Then at the end creating the burn function for burning the tokens.After this check the transactions on https://testnet.snowtrace.io/address/0x67eA8EEAee6442F8542e51017d7aE6e2D94CBdf0.
## Getting Started

### Executing program

1. Write the below ERC20 Contract. (use of open zeppelin)
2. After click on Compile deogen.sol.
3. then Click on Deploy in REMIX IDE. (on the avalanche network)
4. Then call out the functionality and perform the transactions using functions.
5. Then check the transactions and verify it on https://testnet.snowtrace.io/address/0x67eA8EEAee6442F8542e51017d7aE6e2D94CBdf0.
```
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

```


## Authors

Metacrafter Chris
@metacraftersio


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
