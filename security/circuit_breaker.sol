/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

import "../ownership/owner.sol";

contract circuit_breaker is owned {
  function circuit_breaker() {
    stopped = false;
  }
  function toggle_active() only_owner public {
      stopped = !stopped;
  }
  modifier stop_if_emergency() {
    if (!stopped) _
  }
  modifier emergency_only() {
    if (stopped) _
  }
  bool stopped;
}
