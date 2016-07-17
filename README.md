# ExCrypto

**Crypto library in Elixir, using OpenSSL ports**

## Installation

The package can be installed as:

  1. Add ex_crypto to your list of dependencies in `mix.exs`:

        def deps do
          [{:ex_crypto, "~> 0.1.4"}]
        end

  2. Ensure ex_crypto is started before your application:

        def application do
          [applications: [:ex_crypto]]
        end

## Overview

Ex_crypto is a light-weight crypto implementation for Elixir build with simplicity, speed and security in mind.

## Example

You can use ex_crypto in your Elixir application to do the following:

  1. Generate an RSA key pair (in DER format):

        { publicKey, privateKey } = ExCrypto.RSA.getKeypair()

  2. Encrypt using the public key:

        encrypted_secret = RSA.encrypt("Super secret message", publicKey)

  3. Decrypt using the private key:

        decrypted_secret = ExCrypto.RSA.decrypt(encrypted_secret, privateKey)

  4. Sign a message:

        message = "This message should be signed",
        signature = ExCrypto.RSA.sign(message, privateKey)
        if ExCrypto.RSA.verify(message, signatre, publicKey) do
          IO.puts "This signature matches!"
        end

  5. Get message digests:

        hash_md5 = ExCrypto.Hash.md5("Hash me Xerxes in md5!")
        hash_sha224 = ExCrypto.Hash.sha224("Hash me Xerxes in sha224!")
        hash_sha256 = ExCrypto.Hash.sha256("Hash me Xerxes in sha256 (our prefered one)!")
        hash_sha384 = ExCrypto.Hash.sha384("Hash me Xerxes in sha384!")

You can additionally use ex_keypair built with escript, as a command line application, by running:

    mix escript.build
    ./ex_keypair

