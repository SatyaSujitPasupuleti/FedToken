var FEDToken = artifacts.require("./FEDToken");
contract("FEDToken", async(accounts)=>{
    it("should add bonds" , async() =>{
        assert(1+2,3,"added incorrectly");
    })
    it("should add bonds2" , async() =>{
        instance.addBond.call(10,accounts[1]);
        assert(instance.getBondLength(),1,"bond has been successfully added to list");
    })

});