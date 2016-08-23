/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

contract rate_limiter {
  function rate_limiter(uint t) {
    num_calls = 0;
    reset_every = t;
    reset_time = now + t;
  }
  modifier allow_n_times(uint x) {
      if (num_calls++ < x) _
      if (now >= reset_time) reset();
  }
  function reset() {
    num_calls = 0;
    reset_time = now + reset_every;
  }
  uint num_calls;
  uint reset_every;
  uint reset_time;
}
