/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

import "../ownership/owner";

contract mortal is owned {
  function kill() {
    if (msg.sender == owner) suicide(owner);
  }
}
