/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

contract data {
  // storage data goes here
}

contract consumer {
  address _data;
  function consumer(address d) { _data = d; }
  function get_data() returns (address) { return _data; }
}

contract controller is consumer {
  function controller(address d) consumer(d) {}
}
