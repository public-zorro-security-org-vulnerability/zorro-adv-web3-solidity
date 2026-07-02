// ADVERSARIAL FIXTURE — upgradeable proxy with low-level value transfer.
pragma solidity ^0.8.20;

contract UpgradeableToken {
    function upgradeTo(address newImpl) external {
        // upgrade path without timelock
    }

    function payout(address to) external {
        (bool ok, ) = to.call{value: address(this).balance}("");
        require(ok);
    }
}
