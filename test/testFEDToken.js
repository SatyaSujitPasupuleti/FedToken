var FEDToken = artifacts.require("./FEDToken");
contract("FEDToken", async(accounts)=>{
    it("should add bonds" , async() =>{
        var instance = await FEDToken.deployed();
        await instance.addBond.call(10,accounts[0],{from:accounts[0]});
        var bondlength = await instance.getBondLength;
        assert(bondlength,1,"bond has not been added");      
    })
    it("should mint tokens" , async() =>{
        var instance = await FEDToken.deployed();
        await instance.mintToDecrease.call(10,accounts[2],{from:accounts[0]});
        assert(instance.getBalance(accounts[2]),10,"fedtoken has not been correctly minted");

    })
    it("should release bonds" , async() =>{
        var instance = await FEDToken.deployed();
        await instance.transfer.call(10,accounts[3],{from:accounts[0]});
        await instance.addBond.call(10,accounts[3]); 
        await instance.releaseBond.call(1); 
        assert(instance.getBondLength(),0,"bond has not been correctly removed");
        assert(instance.getBalance(accounts[3]),10, "bond has not returned money");
    })

 
   
   
  
});
