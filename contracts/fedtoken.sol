pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
contract FEDToken is MintableToken {
    string public name = "FEDToken";
    string public symbol = "FED";
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLY = 500000000;
    //status of how much money accounts want to put as bonds
    double public price=1.00;
    bool public needMint=false;
    BOND[] bonds;
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
    function releaseBond(uint _numberOfBonds) public{
        require(_numberOfBonds > 0);
        require(bonds.length != 0);
        for(int i = 0 ; i<_numberOfBonds; i++) {
            bonds[i].releaseAmount();
        }

    }
    //call this function if release bonds can't
    function mintToDecrease(double _amount,address _to) public {
        mint(_to,_amount); //mint requires that the owner is calling it

    }
    //called when value of FEDToken needs to be increased
    function addBond(uint _amount, address _bondholder) public{
        BOND bond = new BOND(_bondholder,_amount,address(this));
        bonds.push(bond);

    }

}
contract BOND {
    address bondHolder;
    uint amount;
    address fedTokenAddress;
    FEDToken Fed;
    address owner;
    constructor(address _bondHolder, uint _amount,address _fedToken) public{
        bondHolder = _bondHolder;
        amount = _amount;
        fedTokenAddress = _fedToken;
        owner = msg.sender;

    }
    function releaseAmount() public {
        Fed = FedToken(fedTokenAddress);
        Fed.transfer(amount,bondHolder);
    }

}