var FEDToken = artifacts.require("./FEDToken");
contract("FEDToken", accounts =>{
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
        await instance.addBond.call(10,accounts[0],{from:accounts[0]}); 
        await instance.releaseBond.call(1); //fails on releasing bond may be async await?
        assert(instance.getBondLength(),0,"bond has not been correctly removed");
        assert(instance.getBalance(accounts[0]),10, "bond has not returned money");
    })
    it("should send tokens to contract" , async() =>{
        var instance = await FEDToken.deployed();
        await instance.addBond.call(10,accounts[0],{from:accounts[0]});
        var bond = await instance.getBond.call(0);
        var balance1 = await instance.getBalance.call(bond.address);
        assert(balance1, 10, "tokens have not been sent to contract");
    })
    it("should transfer tokens" , async() =>{
        var instance = await FEDToken.deployed();
        await instance.transfer.call(accounts[2],10,{from:accounts[0]});
    })
});
