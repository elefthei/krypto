defmodule RSA do

  def getKeypair do

    destPath = "/tmp/"
    publicKey = "ExPublicKey.pem"
    privateKey = "ExPrivateKey.pem"
    {_, 0} = System.cmd "openssl", [ "genrsa", "-out", privateKey, "2048"], [stderr_to_stdout: true]
    {_, 0} = System.cmd "openssl", [ "rsa", "-pubout", "-in" , privateKey, "-out", publicKey ], [stderr_to_stdout: true]
    {:ok, priv} = File.read(privateKey)
    {:ok, pub} = File.read(publicKey)

    # Overwrite with random to ensure non-retrieval of keys
    File.copy("/dev/random", privateKey, byte_size(priv))
    File.copy("/dev/random", publicKey, byte_size(pub))

    {_, 0} = System.cmd "rm", ["-f", privateKey]
    {_, 0} = System.cmd "rm", ["-f", publicKey]

    # Return tuple for key pair
    {pub, priv}
  end

  defp getASN1Key(input) when is_binary(input) do
    [ keyEntry ] = :public_key.pem_decode(input)
    :public_key.pem_entry_decode(keyEntry)
  end

  def encrypt(data, publickey) when is_binary(data) do
    :public_key.encrypt_public(data, getASN1Key(publickey))
  end

  def decrypt(data, privatekey) when is_binary(data) do
    :public_key.decrypt_private(data, getASN1Key(privatekey))
  end

  def sign(data, privatekey) when is_binary(data) do
    :public_key.sign(data, :sha256, getASN1Key(privatekey))
  end

  def verify(message, signature, publickey) when is_binary(signature) do
    :public_key.verify(message, :sha256, signature, getASN1Key(publickey))
  end
end
