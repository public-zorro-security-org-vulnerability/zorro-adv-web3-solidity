// SPDX-License-Identifier: MIT
// ADVERSARIAL FIXTURE — AI-generated staking vault with critical access-control gaps.
pragma solidity ^0.8.20;

contract StakingVault {
    mapping(address => uint256) public balances;

    // CRITICAL: unprotected withdraw — anyone can drain pooled funds.
    function withdraw() public {
        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    // CRITICAL: unrestricted mint
    function mint(address to, uint256 amount) external {
        balances[to] += amount;
    }

    function authenticate() public view returns (bool) {
        require(tx.origin == owner, "not owner");
        return true;
    }

    address owner;

    function destroy() public {
        selfdestruct(payable(msg.sender));
    }

    function runDelegate(address target, bytes calldata data) external {
        target.delegatecall(data);
    }
}
