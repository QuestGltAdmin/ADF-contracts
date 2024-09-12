// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract addfillDepositWithdraw {
    address public owner;
    address public adminIn;
    address public adminOut;
    
    modifier OnlyOwner(){
        require(msg.sender == owner, "not owner");
        _;
    }
    
    modifier OnlyAdminOut(){
        require(msg.sender == adminOut, "not admin");
        _;
    }
    
    constructor(address _adminIn , address _adminOut) {
        owner = msg.sender;
        adminIn = _adminIn;
        adminOut = _adminOut;
    }
    
    
    function transferOwnership(address newOwner) public OnlyOwner{
        owner = newOwner;
    }
    
    function setAdmin(address newAdminIn,address  newAdminOut) public OnlyOwner{
         adminIn = newAdminIn;
         adminOut = newAdminOut;
    }

    // Function to transfer TRX
    function depositTRX() payable public{

       payable(adminIn).transfer(msg.value);
       
    }
    
    function  withdrawTRX(address payable recipient) payable public  OnlyAdminOut{

        recipient.transfer(msg.value);
   
    }
    

    // Fallback function to receive TRX
    receive() external payable {}
}