# Krypto

**Crypto library in Elixir, using OpenSSL ports**

## Installation

The package can be installed as:

  1. Add krypto to your list of dependencies in `mix.exs`:

        def deps do
          [{:krypto, "~> 0.1.4"}]
        end

  2. Ensure krypto is started before your application:

        def application do
          [applications: [:krypto]]
        end

## Overview

Krypto is a light-weight crypto implementation for Elixir build with simplicity, speed and security in mind.

## Example

You can use krypto in your Elixir application to do the following:

  1. Generate an RSA key pair (in DER format):

        { publicKey, privateKey } = Krypto.RSA.getKeypair()

  2. Encrypt using the public key:

        encrypted_secret = Krypto.RSA.encrypt("Super secret message", publicKey)

  3. Decrypt using the private key:

        decrypted_secret = Krypto.RSA.decrypt(encrypted_secret, privateKey)

  4. Sign a message:

        message = "This message should be signed",
        signature = Krypto.RSA.sign(message, privateKey)
        if Krypto.RSA.verify(message, signatre, publicKey) do
          IO.puts "This signature matches!"
        end

  5. Get message digests:

        hash_md5 = Krypto.Hash.md5("Hash me in md5!")
        hash_sha224 = Krypto.Hash.sha224("Hash me in sha224!")
        hash_sha256 = Krypto.Hash.sha256("Hash me in sha256 (our prefered one)!")
        hash_sha384 = Krypto.Hash.sha384("Hash me in sha384!")

You can additionally use krypto to generate 2048bit RSA key pairs, built with escript, as a command line application, by running:

    mix escript.build
    ./krypto

