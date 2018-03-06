# Crypto wallets

It is little manual how use diffrerent crypto coin as bitcoin.

#### Create new accaunt.

Returns the current coin address for receiving payments to this account. If <account> does not exist, it will be created along with an associated new address that will be returned.

```sh
$ xxx-cli getaccountaddress <account>
ybkSHnzmTVnSnLxPn6ZhL2M8GsdccKUkZY
```

#### Create new coin address.
Returns a new coin address for receiving payments. If [account] is specified payments received with the address will be credited to [account].

```sh
$ xxx-cli getnewaddress [account]
ydUKN4Joz3FqywiwyzU1DwxQEZRrUSmszD
```