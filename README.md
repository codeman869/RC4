# RC4

###Install

In a terminal window simply install via the gem command

```
$ gem install rc4_cipher
```

another way to add it is to include it in your gemfile

```ruby
gem 'rc4_cipher'
```

###Use

Require the gem in your program and create a new instance of the RC4 object, passing it a key string.

```ruby
require 'rc4_cipher'

cipher = RC4.new("Secret")
```

To receive bytes from the keystream access the key object and use the next function to return values

```ruby
cipher.key.next
```

To encryt & decrypt text, use the encrypt! and decrypt! methods

```ruby
output = "Attack at dawn"
cipher.ecrypt!(output)

cipher2 = RC4.new("Secret")

cipher2.decrypt!(output)
```
