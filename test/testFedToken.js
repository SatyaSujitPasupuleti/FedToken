var fedtoken = artifacts.require("./fedtoken");
contract("fedtoken", async(accounts)=>{
    it("should add bonds" , async() =>{
        let instance = await fedtoken.deployed();
        var accounts = await web3.eth.accounts;
        instance.addBond.call(10,accounts[1]);
        assert(instance.getBondLength(),1,"bond has been successfully added to list");

    })
    it("should check if it can mint tokens to another specified address" , async() =>{

    })
    it("should release the bond amount" , async() =>{

    })
});
//test following functionalities of fedToken:
