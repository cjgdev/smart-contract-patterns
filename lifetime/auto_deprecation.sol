/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

contract auto_deprecate {
  function auto_deprecate(uint t) {
    expires = now + t;
  }
  function expired() returns (bool) {
    return now > expires ? true : false;
  }
  modifier will_deprecate() {
      if (!expired()) _
  }
  modifier when_deprecated() {
      if (expired()) _
  }
  uint expires;
}
