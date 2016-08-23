import 'dapple/test.sol';
import 'security/rejector.sol';

contract RejectorTest is Test {
  function testRejectorThrow() {
    rejector target = new rejector();
    var success = address(target).send(1);
    assertEq(success, false);
  }
}
