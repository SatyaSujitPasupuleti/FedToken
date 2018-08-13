pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
contract FEDToken is MintableToken {
    string public name = "FEDToken";
    string public symbol = "FED";
    uint8 public decimals = 10;
    uint public INITIAL_SUPPLY = 500000000;
    double public price=1.00;
    double public dollarvalue=1.00;
    //get price and compare it to dollar value
    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
    function setPrice(double _newprice) public{
        //used in testing to manipulate the FEDToken
        price = _newprice;
    }
    function lowerValue()public {
        //calculate number of bonds to be released
        //release bonds
        //wait for web3.js to check if it has returned to the right amount
        //mint more tokens
        //calculate value
        


    }
    function increaseValue(double _amount) public {
        //calculate number of bonds needed to be added
        //addBonds

    }
 
    function mintToDecrease(double _amount,address _to) public {
        //web3.js calls this function and loops 
           //mint function is inherited 
    //call mint to the number of accounts in the balances in the formula

    }
    function releaseBond(double _numberOfBonds) public{

    }
    function addBond(double _numberOfBonds) public{

    }

}