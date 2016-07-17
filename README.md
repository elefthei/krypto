# ExKeypair

**RSA key pair generation in Elixir, using OpenSSL ports**

## Installation

The package can be installed as:

  1. Add ex_keypair to your list of dependencies in `mix.exs`:

        def deps do
          [{:ex_keypair, "~> 0.0.3"}]
        end

  2. Ensure ex_keypair is started before your application:

        def application do
          [applications: [:ex_keypair]]
        end

## Example

You can use ex_keypair as a command line application, by running:

    mix escript.build
    ./ex_keypair

Or use it as an Elixir module:

    {public, private} = ExKeypair.keypair()
