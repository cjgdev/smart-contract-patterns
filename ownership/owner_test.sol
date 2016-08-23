import 'dapple/test.sol';
import 'ownership/owner.sol';

contract EventDefinitions {
  event called_me(bytes data);
}

contract OwnerMock is owned, EventDefinitions {
  function restricted() only_owner {
    called_me('restricted');
  }
}

contract OwnerTest is Test, EventDefinitions {
  OwnerMock target;
  Tester proxy_tester;

  function setUp() {
    target = new OwnerMock();
    proxy_tester = new Tester();
    proxy_tester._target(target);
  }

  function testOnlyOwner() {
    expectEventsExact(target);
    called_me('restricted');
    target.restricted();
  }

  function testRestrictedIsOwnerOnly() {
    expectEventsExact(target);
    OwnerMock(proxy_tester).restricted();
  }
}
