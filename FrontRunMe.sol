// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.10;


contract FrontRunMe{
    event sucess(uint _balanceSmartContract, uint _balanceExecutor);
    event fail(uint _balanceSmartContract, uint _balanceExecutor);
    
    bytes32 public secretHash;
    
    constructor (bytes32 _secretHash) public payable {
        secretHash = _secretHash;
    }
    
    function take(string calldata _secret) external {
        if(keccak256(abi.encodePacked(_secret)) == secretHash) {
            uint _balanceExecutor = address(this).balance;
            msg.sender.transfer(_balanceExecutor);
            uint _balanceSmartContract = 0;
            emit sucess(_balanceSmartContract,_balanceExecutor);
            
        } else {
            uint _balanceSmartContract = address(this).balance;
            uint _balanceExecutor = 0;
            emit fail(_balanceSmartContract, _balanceExecutor);
        }
    }
    
}