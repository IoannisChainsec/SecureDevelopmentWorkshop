function testNonZeroFee(uint amount) public {
    //your code goes here...
    vm.assume(amount > 0);
    uint aliceBalance = ERC20(weth).balanceOf(alice);
    vm.assume(amount <= aliceBalance);
    uint balanceBefore = fund.balanceOf(deployer);
    vm.prank(alice);
    fund.deposit(amount);
    uint balanceAfter = fund.balanceOf(deployer);
    require(balanceAfter - balanceBefore > 0);
}

function testUSDT() public {
    vm.prank(deployer);
    uint deployerBalance = ERC20(fund).balanceOf(deployer);
    fund.withdraw(deployerBalance);
}
