/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

contract owned {
  function owned() {
    owner = msg.sender;
  }
  modifier only_owner() {
    if(msg.sender == owner) _
  }
  address owner;
}
