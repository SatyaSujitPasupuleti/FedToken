var FEDToken = artifacts.require("./FEDToken");
contract("FEDToken", async(accounts)=>{
    let instance = await FEDToken.deployed();
    var accounts = await web3.eth.accounts;
    it("should add bonds" , async() =>{
        instance.addBond.call(10,accounts[1]);
        assert(instance.getBondLength(),1,"bond has been successfully added to list");
    })
    it("should check if it can mint tokens to another specified address" , async() =>{
        instance.mintToDecrease.call(10,accounts[2]);
        assert(instance.balances[accounts[2]],10,"fedtoken has been correctly minted");
    })
    it("should release the bond amount" , async() =>{
        instance.addBond.call(10,accounts[1]);
        instance.releaseBond.call(1);
        assert(instance.getBondLength(),0,"bond has been successfully removed");
        assert(instance.balances[accounts[1]],10, "bond has returned money to owner of bond");
    })
});

