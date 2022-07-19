// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "interfaces/IWETH.sol";
import "src/Fund.sol";
import "src/mock/WETH.sol";
import "forge-std/Test.sol";
import {console} from "forge-std/console.sol";


// A simple fuzzing test to detect non-zero deposit fee
contract IntegrationTests is Test {

    Fund fund;

    address WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    uint UNIT = 10**18;

    address deployer = address(2);
    address alice = address(3);
    address bob = address(4);
    
    address weth;

    function setUp() public {

        //Deploy mock WETH
        weth = address(new WETH9());

        vm.deal(deployer, UNIT);

        // init the fund contract
        vm.startPrank(deployer);
        fund = new Fund("TestFund", "TST", weth);
        IWETH(weth).deposit{value: UNIT}();
        IWETH(weth).approve(address(fund), UNIT);
        fund.deposit(UNIT);
        vm.stopPrank();

        // alice deposit and approve 1 eth to weth
        vm.deal(alice, UNIT);

        vm.startPrank(alice);
        IWETH(weth).deposit{value: UNIT}();
        IWETH(weth).approve(address(fund), UNIT);
        vm.stopPrank();

        // bob deposit and approve 1 eth to weth
        vm.deal(bob, UNIT);

        vm.startPrank(bob);
        IWETH(weth).deposit{value: UNIT}();
        IWETH(weth).approve(address(fund), UNIT);   
        vm.stopPrank();
    }

    function testDeposit() public {

        vm.prank(alice);
        fund.deposit(UNIT);

        uint alice_balance = fund.balanceOf(alice);

        // bob deposit another amount
        vm.prank(bob);
        fund.deposit(UNIT);
        uint bob_balance = fund.balanceOf(bob);

        assertEq(alice_balance*fund.pricePerShare(), bob_balance*fund.pricePerShare());
    }

    // Remember we have setup 3 accounts already:
    // deployer, alice and bob
    // If you want a more fine-grained control over the fuzzed value
    // consider using vm.assume(bool)
    // More here: https://book.getfoundry.sh/cheatcodes/
    function testNonZeroFee(uint amount) public {
        //your code goes here...
    }
}
