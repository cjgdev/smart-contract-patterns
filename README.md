# Smart-Contract Patterns

Writing good software has never been an easy task, however the introduction of
common design patterns by the gang of four (Gamma, Helm, Johnson, Vlissides) in
their seminal book 'Design Patterns' in 1995, went a long way to creating a
language of patterns, an essential method of describing solutions to common
problems.

This is a library of smart-contract patterns written in `Solidity`. Writing
smart-contracts has been proven to be difficult, exemplified by TheDAO in recent
events. It is my intention that this repository will serve the community by
collating the most useful smart-contract patterns for public benefit.

## Patterns

The patterns are logically divided into four groupings. `Lifetime` is a group of
patterns that control the construction and destruction of smart-contracts.
`Maintenance` is a group of patterns that provide mechanisms for live contracts.
`Ownership` is a group of patterns that control access to smart-contract. And
finally `Security` is a group of patterns that seek to mitigate security related
matters.

### Lifetime

`auto_deprecation` - Provides a mechanism for automatic expiration of a contract
interface after some period of time has elapsed.
[lifetime/auto_deprecation.sol](lifetime/auto_deprecation.sol)

`mortal` - Provides a method for the creator of a contract to destroy it.
[lifetime/mortal.sol](lifetime/mortal.sol)

### Maintenance

`relay` - Provides a method for the creator of a contract to update it to a
newer version without invalidating the address.
[maintenance/relay.sol](maintenance/relay.sol)

`data_segregation` - Segregates a contract and its data so as to avoid costly
data migrations.
[maintenance/data_segregation.sol](maintenance/data_segregation.sol)

### Ownership

`owner` - Limits access to certain functions to only the owner of the contract.
[ownership/owner.sol](ownership/owner.sol)

### Security

`circuit_breaker` - The circuit breaker pattern allows the owner to disable or
enable a contract by a runtime toggle.
[security/circuit_breaker.sol](security/circuit_breaker.sol)

`rejector` - The rejector pattern automatically rejects all ether sent to it.
[security/rejector.sol](security/rejector.sol)

`speed_bump` - The speed bump pattern limits how often a function can be called
to deliberately slow down certain functions.
[security/speed_bump.sol](security/speed_bump.sol)

## Contributions

Contributions are welcome. Please use the issue tracker to submit requests or
report issues.

If you would like to submit a pattern to the library, please first submit a
proposal via the issue tracker.

## License

The code contained within this repository is licensed and distributed under the
Apache 2.0 license. It is my intention to invite derivative works, as well as
encourage commercial use without obligation.

[LICENSE](LICENSE)
