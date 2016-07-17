defmodule Hash do
  def md5(input) do
    :crypto.hash(:md5, input) |> Base.encode16
  end

  def sha224(input) do
    :crypto.hash(:sha224, input) |> Base.encode16
  end

  def sha256(input) do
    :crypto.hash(:sha256, input) |> Base.encode16
  end

  def sha384(input) do
    :crypto.hash(:sha384, input) |> Base.encode16
  end

  def sha512(input) do
    :crypto.hash(:sha512, input) |> Base.encode16
  end
end

