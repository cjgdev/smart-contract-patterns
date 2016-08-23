import 'dapple/test.sol';
import 'lifetime/auto_deprecation.sol';

contract MockAutoDeprecate is auto_deprecate {
  function MockAutoDeprecate() auto_deprecate(1 days) {}

  function should_succeed() will_deprecate returns (bool) { return true; }
}

contract AutoDeprecationTest is Test {
  MockAutoDeprecate target;

  function setUp() {
    target = new MockAutoDeprecate();
  }

  function testWillDeprecate() {
    assertEq(true, target.should_succeed());
  }
}
