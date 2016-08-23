/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

contract speed_bump {
  function speed_bump() {
    allowed_time = 0;
  }
  modifier allow_every(uint t) {
      if (now >= allowed_time) { _
        allowed_time = now + t;
      }
  }
  function set_allowed_time(uint t) {
    allowed_time = now + t;
  }
  uint allowed_time;
}
