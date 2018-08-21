pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
contract FEDToken is MintableToken {
    string public name = "FEDToken";
    string public symbol = "FED";
    uint8 public decimals = 10;
    uint public INITIAL_SUPPLY = 500000000;
    //status of how much money accounts want to put as bonds
    double public price=1.00;
    bool public needMint=false;
    address[uint[]] bonds; //updated via web3.js form
    //get price and compare it to dollar value
    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
    function setPrice(double _newprice) public{
        //used in testing to manipulate the FEDToken
        price = _newprice;
    }
    
    //call this function first when value of FEDToken needs to be decreased
    function releaseBond(double _numberOfBonds) public{

    }
    //call this function if release bonds can't
    function mintToDecrease(double _amount,address _to) public {
        //web3.js calls this function and loops in js
           //mint function is inherited 
    //call mint to the number of accounts in the balances in the formula
        mint(_to,_amount); //mint requires that the owner is calling it

    }
    //called when value of FEDToken needs to be increased
    function addBond(double _numberOfBonds) public{

    }

}
contract BOND {
    address bondHolder;
    uint amount;
    constructor(address _bondHolder, uint _amount,address fedToken) public{

    }
    function releaseAmount() private {
        

    }

}