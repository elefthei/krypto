defmodule Krypto do
  import RSA
  import Hash

  def main(args) do
    IO.inspect RSA.getKeypair()
  end
end
