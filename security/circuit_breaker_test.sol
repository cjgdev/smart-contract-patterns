import 'dapple/test.sol';
import 'security/circuit_breaker.sol';

contract EventDefinitions {
  event called_me(bytes data);
}

contract CircuitBreakerMock is circuit_breaker, EventDefinitions {
  function stopped_in_emergency() stop_if_emergency {
    called_me('stopped in emergency');
  }

  function only_in_emergency() emergency_only {
    called_me('only in emergency');
  }
}

contract CircuitBreakerTest is Test, EventDefinitions {
  CircuitBreakerMock target;

  function setUp() {
    target = new CircuitBreakerMock();
  }

  function testStopInEmergency() {
    expectEventsExact(target);
    called_me('stopped in emergency');

    target.stopped_in_emergency();

    target.toggle_active();
    target.stopped_in_emergency();
  }

  function testOnlyInEmergency() {
    expectEventsExact(target);
    called_me('only in emergency');

    target.toggle_active();
    target.only_in_emergency();

    target.toggle_active();
    target.only_in_emergency();
  }
}
