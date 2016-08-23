/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

contract mutex {
  enum state { acquired, available }
  state   s;
  address locked_by;
  function mutex() {
    s = available;
  }
  function acquire() returns (bool) {
    if (s == available) {
      s = acquired;
      locked_by = msg.sender;
      return true;
    }
    return false;
  }
  function release() returns (bool) {
    if (s == acquired && msg.sender == locked_by) {
      s = available;
      locked_by = 0;
      return true;
    }
    return false;
  }
  modifier when_lockable() {
    if (acquire()) { _
      release();
    }
  }
}
