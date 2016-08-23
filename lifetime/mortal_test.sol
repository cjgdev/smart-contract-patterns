import 'dapple/test.sol';
import 'lifetime/mortal.sol';

contract MortalTest is Test {
  mortal target;

  function setUp() {
    target = new mortal();
  }

  function testKill() {
    target.kill();
  }

  function testDoubleKillThrow() {
    target.kill();
    target.kill();
  }
}
