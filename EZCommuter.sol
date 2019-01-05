pragma solidity ^0.4.18;

contract GovernmentContract{
    
    address owner;
    uint returnCount;
    
    struct Tendor {
        uint id;
        string roadTendorTitle;
        string roadLoc;
        uint roadCost;
        uint roadMinTime;
        uint roadMaxTime;
        
    }
    
   Tendor[] public tendor;
    
    function setTendor(uint _id , string _roadTendorTitle , string _roadLoc , uint _roadCost , uint _roadMinTime , uint _roadMaxTime) public payable {
        tendor.length++;
        tendor[tendor.length- 1].id = _id;
        tendor[tendor.length- 1].roadTendorTitle = _roadTendorTitle;
        tendor[tendor.length- 1].roadLoc = _roadLoc;
        tendor[tendor.length- 1].roadCost = _roadCost;
        tendor[tendor.length- 1].roadMinTime = _roadMinTime;
        tendor[tendor.length- 1].roadMaxTime = _roadMaxTime;
    }
    
    
    function getTendor(uint _id)  constant public returns (string, string , uint ,uint ,uint) {
        return (tendor[_id].roadTendorTitle, tendor[_id].roadLoc, tendor[_id].roadCost, tendor[_id].roadMinTime , tendor[_id].roadMaxTime );
    }
    
    function countTendor() view public returns (uint) {
        return tendor.length;
    }
    
    
    
    
    
    
    
    
    
    struct Supp {
        uint id;
        uint asphaltGM;
        uint soilGM;
        uint gravelGM;
        uint concreteGM;
        uint slateGM;
        uint SuppCost;
    } 
    
     Supp[] public supplier;
    
    function setSupp(uint _id, uint _asphaltGM, uint _soilGM , uint _gravelGM , uint _concreteGM , uint _slateGM , uint _SuppCost) public payable {
       supplier.length++;
        
        supplier[supplier.length- 1].id = _id;
        supplier[supplier.length- 1].asphaltGM = _asphaltGM;
        supplier[supplier.length- 1].soilGM = _soilGM;
        supplier[supplier.length- 1].gravelGM = _gravelGM;
        supplier[supplier.length- 1].concreteGM = _concreteGM;
        supplier[supplier.length- 1].slateGM = _slateGM;
        supplier[supplier.length- 1].SuppCost = _SuppCost;
        
    }
    
   
    function getSupplier(uint _id) view public returns (uint, uint, uint , uint , uint , uint) {
        return (supplier[_id].asphaltGM,supplier[_id].soilGM, supplier[_id].gravelGM , supplier[_id].concreteGM , supplier[_id].slateGM ,supplier[_id].SuppCost);
    }
    
    function countSupplier() view public returns (uint) {
        return supplier.length;
    }
    
    
    
    
    
    
    
    
    
    struct WorkerHead {
        uint workerId;
        string workerName;
        string workerDetail;
        uint workerCost;
    }
    
    WorkerHead[] public worker;
    
    function setWorker(uint _id , string _workerName , string _workerDetail , uint _workerCost) public payable{
        worker.length++;
        worker[worker.length-1].workerId = _id;
        worker[worker.length-1].workerName = _workerName;
        worker[worker.length-1].workerDetail = _workerDetail;
        worker[worker.length-1].workerCost = _workerCost;
       
    }
   
    
    function getWorker(uint _id) view public returns (string,string, uint) {
        return (worker[_id].workerName , worker[_id].workerDetail , worker[_id].workerCost);
    }
    
    function countWorker() view public returns (uint) {
        return worker.length;
    }
    
    
    
    
    
    
    
     struct ConTen {
        uint id;
        uint tendoraddress;
        uint contractoraddress;
        string contractorName;
        string contractorDetails;
        string contractorInfoAddress;
        uint roadCostCon;
        uint roadTimeCon;
        uint contractorReputation;
    }
    
    ConTen[] public conten;
    
    function fillTendor(uint _id , uint _tendoraddress , uint _contractoraddress , string _contractorName , string _contractorDetails , string _contractorInfoAddress , uint _roadTimeCon , uint _roadCostCon , uint _contractorReputation ) public payable {
        conten.length++;
        conten[conten.length-1].id =_id;
        conten[conten.length-1].tendoraddress = _tendoraddress;
        conten[conten.length-1].contractoraddress = _contractoraddress;
        conten[conten.length-1].contractorName = _contractorName;
        conten[conten.length-1].contractorDetails = _contractorDetails;
        conten[conten.length-1].contractorInfoAddress = _contractorInfoAddress;
        conten[conten.length-1].roadTimeCon = _roadTimeCon;
        conten[conten.length-1].roadCostCon = _roadCostCon;
        conten[conten.length-1].contractorReputation = _contractorReputation;
    }
    
    function winner() view public returns(uint,uint){
        uint temp = 9999;
        uint flag=0;
        for(uint i =0 ; i<conten.length-1;i++){
            if(temp>conten[i].roadCostCon){
                temp=conten[i].roadCostCon;
                flag=conten[i].contractoraddress;
            }
        }
        return (temp,flag);
        
    }
    
    
    
 /*   
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    struct ConTen {
        address tendoraddress;
        address contractoraddress;
        string contractorName;
        string contractorDetails;
        string contractorInfoAddress;
        uint roadCostCon;
        uint roadTimeCon;
        uint contractorReputation;
    }
    
    mapping (address => bool) tendorBool;
    mapping (address => ConTen) conntenn;
    
    address[] public connTennAccts;
    
    mapping (address => bool) started;
    
    address winnerContractorAddress;
    
    
    
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    function GovernmentContract() public{
        owner = msg.sender;
    }
    
    function fillTendor(address _address , address tendorAddress , address contractorAddress , string _contractorName , string _contractorDetails , string _contractorInfoAddress , uint _roadTimeCon , uint _roadCostCon , uint _contractorReputation ) public payable {
        var contendor = conntenn[_address];
        
        contendor.tendoraddress = tendorAddress;
        contendor.contractoraddress = contractorAddress;
        contendor.contractorName = _contractorName;
        contendor.contractorDetails = _contractorDetails;
        contendor.contractorInfoAddress = _contractorInfoAddress;
        contendor.roadTimeCon = _roadTimeCon;
        contendor.roadCostCon = _roadCostCon;
        contendor.contractorReputation = _contractorReputation;
        
        connTennAccts.push(_address) -1;
    }
    
    function showTendorFilled() view public returns(address[]) {
        return connTennAccts;
    }
    
    function showTendorFilled(address _address) view public returns (address , address , string , string , string , uint, uint ) {
        return (conntenn[_address].tendoraddress , conntenn[_address].contractoraddress , conntenn[_address].contractorName , conntenn[_address].contractorDetails , conntenn[_address].contractorInfoAddress ,conntenn[_address].roadCostCon ,conntenn[_address].roadTimeCon);
    }
    
    function openTendor(address winnerTendorAddress) view public returns (uint) {
        uint win = getPickWinner(winnerTendorAddress); 
        return win;
    }
    
    function getPickWinner(address _winnerTendorAddress) public view returns(uint256){
        uint lowestValue=99999;
        
        
        for(uint i =0; i<connTennAccts.length; i++){
            if(_winnerTendorAddress == conntenn[connTennAccts[i]].tendoraddress )
                //require(started[conntenn[connTennAccts[i]].tendoraddress]);
                if(lowestValue > conntenn[connTennAccts[i]].roadCostCon){
                    lowestValue = conntenn[connTennAccts[i]].roadCostCon;
                    winnerContractorAddress = conntenn[connTennAccts[i]].contractoraddress;
                }
                    
        }
        
        return lowestValue;
    }
    
    function startedTendor(address _tendorAdrres) onlyOwner{
        started[_tendorAdrres]=true;
    }
    
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    struct Supp {
        uint asphaltGM;
        uint soilGM;
        uint gravelGM;
        uint concreteGM;
        uint slateGM;
        uint SuppCost;
    } 
    
    mapping (address => Supp) senn;
    address[] public sennAccts;
    
    function setSupp(address _address, uint _asphaltGM, uint _soilGM , uint _gravelGM , uint _concreteGM , uint _slateGM , uint _SuppCost) public payable {
        var supplier = senn[_address];
        
        supplier.asphaltGM = _asphaltGM;
        supplier.soilGM = _soilGM;
        supplier.gravelGM = _gravelGM;
        supplier.concreteGM = _concreteGM;
        supplier.slateGM = _slateGM;
        supplier.SuppCost = _SuppCost;
        
        sennAccts.push(_address) -1;
    }
    
    function getSupplier() view public returns(address[]) {
        return sennAccts;
    }
    
    function getSupplier(address _address) view public returns (uint, uint, uint , uint , uint , uint) {
        return (senn[_address].asphaltGM, senn[_address].soilGM, senn[_address].gravelGM , senn[_address].concreteGM , senn[_address].slateGM , senn[_address].SuppCost);
    }
    
    function countSupplier() view public returns (uint) {
        return sennAccts.length;
    }
    
    
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    struct WorkerHead {
        uint workerId;
        string workerName;
        string workerDetail;
        uint workerCost;
    }
    
    mapping (address => WorkerHead) wenn;
    address[] public wennAccts;
    
    function setWorker(address _address, uint _workerId , string _workerName , string _workerDetail , uint _workerCost) public payable{
        var worker = wenn[_address];
        
        worker.workerId = _workerId;
        worker.workerName = _workerName;
        worker.workerDetail = _workerDetail;
        worker.workerCost = _workerCost;
        
        
        wennAccts.push(_address) -1;
    }
    
    function getWorker() view public returns(address[]) {
        return wennAccts;
    }
    
    function getWorker(address _address) view public returns (uint, string,string, uint) {
        return (wenn[_address].workerId , wenn[_address].workerName , wenn[_address].workerDetail , wenn[_address].workerCost);
    }
    
    function countWorker() view public returns (uint) {
        return wennAccts.length;
    }
    
    
    
    
/*    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    struct Contractor {
        uint age;
        string fullName;
        uint reputation;
    }
    
    mapping (address => Contractor) conn;
    address[] public connAccts;
    
    function setContractor(address _address, uint _age, string _fullName, uint _reputation) public {
        var contractor = conn[_address];
        
        contractor.age = _age;
        contractor.fullName = _fullName;
        contractor.reputation = _reputation;
        
        connAccts.push(_address) -1;
    }
    
    function getContractor() view public returns(address[]) {
        return connAccts;
    }
    
    function getContractor(address _address) view public returns (uint, string, uint) {
        return (conn[_address].age, conn[_address].fullName, conn[_address].reputation);
    }
    
    function countContractor() view public returns (uint) {
        return connAccts.length;
    }*/
    
}