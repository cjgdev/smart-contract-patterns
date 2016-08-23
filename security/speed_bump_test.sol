import 'dapple/test.sol';
import 'security/speed_bump.sol';

contract EventDefinitions {
  event called_me(bytes data);
}

contract SpeedBumpMock is speed_bump, EventDefinitions {
  function limited() allow_every(5 hours) {
    called_me('limited');
  }
}

contract SpeedBumpTest is Test, EventDefinitions {
  SpeedBumpMock target;

  function setUp() {
    target = new SpeedBumpMock();
  }

  function testLimited() {
    expectEventsExact(target);
    called_me('limited');

    target.limited();
    target.limited();
  }

  function testLimitReset() {
    expectEventsExact(target);
    called_me('limited');
    called_me('limited');

    target.limited();
    target.set_allowed_time(0 seconds);
    target.limited();
    target.limited();
  }
}
