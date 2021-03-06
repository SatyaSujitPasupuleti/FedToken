pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
/**
 * @title FedToken
 * @dev ERC20 compatible token that responds to price increases and keeps the value
 * of the token stable
 */
contract FEDToken is MintableToken {
    string public name = "FEDToken";
    string public symbol = "FED";
    uint8 public decimals = 9;
    uint public INITIAL_SUPPLY = 500000000;
    uint public price=100;
    bool public needMint=false;
    BOND[] bonds;
    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }  
     /**
     * @dev transfers value of bond back to owner
     * @param _numberOfBonds the number of bonds to be released
     */
    function releaseBond(uint _numberOfBonds) public{
     
        for(uint i = 0 ; i<_numberOfBonds; i++) {
            bonds[i].releaseAmount();
            delete bonds[i];
        }
    }
      /**
     * @dev mints more tokens, called for every token holder
     * @param _amount amount of tokens to be minted to
     * @param _to address to mint the tokens to
     */
    function mintToDecrease(uint _amount,address _to) public {
        mint(_to,_amount); //mint requires that the owner is calling it

    }
     /**
     * @dev adds bonds that store tokens
     * @param _amount amount of tokens to be stored
     * @param _bondholder the address that holds the bond
     */
    function addBond(uint _amount, address _bondholder) public{
        BOND bond = new BOND(_bondholder,_amount,address(this));
        transferFrom2(_bondholder,bond.getAddress(),_amount);
        bonds.push(bond);
    }
    function getBondLength() public view returns(uint){
        return bonds.length;
    }
    
    function getBalance(address _address) public view returns(uint){
        return balances[_address];
    }
    function transferFrom2(address _from, address _to,uint256 _value) public returns(bool)
    {   
        approve(_to,_value);
        transferFrom(_from,_to,_value);
    }
    function getBond(uint _bondnumber) public view returns(BOND){
        return bonds[_bondnumber];
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
     /**
     * @dev releases the tokens in the bond contract
     */
    function releaseAmount() public {
        Fed = FEDToken(fedTokenAddress);
        Fed.transferFrom2(address(this),owner,amount); 
    }
    function getBalance() public {
        Fed = FEDToken(fedTokenAddress);
        Fed.getBalance(address(this));
    }
    function getAddress() public view returns(address){
        return address(this);
    }

 

}