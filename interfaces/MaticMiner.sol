// SPDX-License-Identifier: MIT
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.5.2. SEE SOURCE BELOW. !!
pragma solidity ^0.4.26;

interface MaticMiner {
    function ceoAddress() external view returns (address);

    function getMyMiners() external view returns (uint256);

    function getBalance() external view returns (uint256);

    function initialized() external view returns (bool);

    function calculateTrade(
        uint256 rt,
        uint256 rs,
        uint256 bs
    ) external view returns (uint256);

    function calculateEggBuy(uint256 eth, uint256 contractBalance)
        external
        view
        returns (uint256);

    function marketEggs() external view returns (uint256);

    function sellEggs() external;

    function devFee(uint256 amount) external pure returns (uint256);

    function seedMarket() external payable;

    function hatchEggs(address ref) external;

    function getMyEggs() external view returns (uint256);

    function lastHatch(address) external view returns (uint256);

    function claimedEggs(address) external view returns (uint256);

    function hatcheryMiners(address) external view returns (uint256);

    function EGGS_TO_HATCH_1MINERS() external view returns (uint256);

    function calculateEggBuySimple(uint256 eth) external view returns (uint256);

    function calculateEggSell(uint256 eggs) external view returns (uint256);

    function referrals(address) external view returns (address);

    function ceoAddress2() external view returns (address);

    function getEggsSinceLastHatch(address adr) external view returns (uint256);

    function buyEggs(address ref) external payable;
}
