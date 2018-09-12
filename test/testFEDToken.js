var FEDToken = artifacts.require("./FEDToken");
contract("FEDToken", async()=>{
    
    
    it("should add bonds" , async() =>{
        var instance = await FEDToken.deployed();
        var accounts = await web3.eth.accounts;
        
        instance.addBond.call(10,accounts[1]);
        assert(instance.getBondLength(),1,"bond has been successfully added to list");

       
        instance.mintToDecrease.call(10,accounts[2],{from:accounts[1]});
        assert(instance.getBalance(accounts[2]),10,"fedtoken has been correctly minted");

      
        instance.mintToDecrease.call(10,accounts[3],{from:accounts[1]});

        instance.addBond.call(10,accounts[3]); //accounts[3] has 0 fedtoken to transfer
        instance.releaseBond.call(1); //fails because of require in transfer
        assert(instance.getBondLength(),0,"bond has been successfully removed");
        assert(instance.getBalance(accounts[3]),10, "bond has returned money to owner of bond");


        
    })

 
   
   
  
});

