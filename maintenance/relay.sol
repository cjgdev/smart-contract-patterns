/*
 The following code is a part of the smart contract patterns library:
   http://www.github.com/blockchaindev/smart-contract-patterns
*/

import 'ownership/owner.sol';

contract relay is owned {
    address public current;
    function relay(address c) {
        current = c;
    }
    function update(address c) public only_owner() {
        current = c;
    }
    function() {
        if(!current.delegatecall(msg.data)) throw;
    }
}
