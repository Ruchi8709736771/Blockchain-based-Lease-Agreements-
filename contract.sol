// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract LeaseAgreement {
    string public projectTitle = "Blockchain-based Lease Agreements";
    string public projectDescription = "Create smart contracts for managing rental agreements.";
    
    struct Agreement {
        address landlord;
        address tenant;
        uint256 rentAmount;
        uint256 leaseDuration;
        bool isActive;
    }
    
    Agreement public lease;
    
    function createLease(address _tenant, uint256 _rentAmount, uint256 _leaseDuration) public {
        lease = Agreement({
            landlord: msg.sender,
            tenant: _tenant,
            rentAmount: _rentAmount,
            leaseDuration: _leaseDuration,
            isActive: true
        });
    }
    
    function terminateLease() public {
        require(msg.sender == lease.landlord || msg.sender == lease.tenant, "Not authorized");
        lease.isActive = false;
    }
    
    function getLeaseDetails() public view returns (Agreement memory) {
        return lease;
    }
}
