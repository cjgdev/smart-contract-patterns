import 'dapple/test.sol';
import 'maintenance/relay.sol';

contract EventDefinitions {
  event on_call(bytes data);
}

contract API_v1 is EventDefinitions {
  function f() {
    on_call('api v1');
  }
}

contract API_v2 is API_v1 {
  function f() {
    on_call('api v2');
  }
}

contract RelayTest is Test, EventDefinitions {
  relay target;
  Tester proxy_tester;

  function setUp() {
    target = new relay(new API_v1());
    proxy_tester = new Tester();
    proxy_tester._target(target);
  }

  function testRelay() {
    expectEventsExact(target);
    on_call('api v1');
    on_call('api v2');

    API_v1(target).f();

    relay(target).update(new API_v2());
    API_v2(target).f();
  }

  function testUpdateIsOwnerOnly() {
    expectEventsExact(target);
    on_call('api v1');
    on_call('api v1');

    API_v1(target).f();

    relay(proxy_tester).update(new API_v2());
    API_v2(target).f();
  }
}
