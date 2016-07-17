defmodule ExKeypair do
  @doc
  '''
  An Elixir crypto library based on Erlang cryptp, public_key and OpenSSL ports.
  '''
  import Hash
  import RSA

  def main(args) do
    IO.inspect RSA.getKeypair()
  end

end
