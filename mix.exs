defmodule Krypto.Mixfile do
  use Mix.Project

  def project do
    [app: :krypto,
     version: "0.1.1",
     escript: [main_module: Krypto],
     elixir: "~> 1.5",
     package: package(),
     description: description(),
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    Crypto implementation in Elixir, using Erlang crypto, public_key and OpenSSL ports.
    """
  end

  defp package do
    [# These are the default files included in the package
     name: :krypto,
     files: ["lib", "test", "config", "mix.exs", "README*", "LICENSE*" ],
     maintainers: ["Lef Ioannidis"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/elefthei/krypto",
              "Docs" => "https://github.com/elefthei/krypto"}]
  end
end
