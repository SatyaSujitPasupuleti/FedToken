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
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLY = 500000000;
    //status of how much money accounts want to put as bonds
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
        require(_numberOfBonds > 0);
        require(bonds.length != 0);
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
        bonds.push(bond);
        balances[_bondholder] = balances[_bondholder] - _amount;

    }
    function getBondLength() public view returns(uint){
        return bonds.length;
    }
    function transfer(uint _amount, address _address) public{
        transfer(_amount, _address);

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
        Fed.transfer(amount,bondHolder);
    }

}