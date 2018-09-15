var FEDToken = artifacts.require("./FEDToken");
contract("FEDToken", async(accounts)=>{
    it("should add bonds" , async() =>{
        let instance = await FEDToken.deployed();
        await instance.addBond.call(10,accounts[0],{from:accounts[0]});
        assert(instance.getBondLength.call(),1,"bond has been successfully added to list");      
    })
    it("should mint tokens" , async() =>{
        let instance = await FEDToken.deployed();
        await instance.mintToDecrease.call(10,accounts[2],{from:accounts[1]});
        assert(instance.getBalance(accounts[2]),10,"fedtoken has been correctly minted");

    })
    it("should release bonds" , async() =>{
        let instance = await FEDToken.deployed();
        await instance.transfer.call(10,accounts[3],{from:accounts[1]});
        await instance.addBond.call(10,accounts[3]); 
        await instance.releaseBond.call(1); 
        assert(instance.getBondLength(),0,"bond has been successfully removed");
        assert(instance.getBalance(accounts[3]),10, "bond has returned money to owner of bond");

    })

 
   
   
  
});

