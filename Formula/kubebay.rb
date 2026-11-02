class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "887e107d65641ad5e5a8574e853956a5748100d5f5f30c92ef838e8bf5bf2cbe"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "83804bbd0b53bc81cbf2cae7c726ba7a93109693504423e72fea59fcdef0ec37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-arm64.tar.gz"
      sha256 "b39ba5ad766db0d7e934eed9293068e105510106a17b50fbb4e02523f962ec00"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-amd64.tar.gz"
      sha256 "a88e6ee1adfc9ab0e04ac246e08fe220a853f188b79f300d325d031433b5e71d"
    end
  end

  def install
    bin.install "kubebay"
  end

  service do
    run [opt_bin/"kubebay", "--addr", "127.0.0.1:9898", "--no-open"]
    keep_alive true
  end

  def caveats
    <<~EOS
      Run directly:  kubebay
      As a service:  brew services start rajasardar/tap/kubebay
      The UI is at http://127.0.0.1:9898 and its token is printed on first start.
    EOS
  end

  test do
    system "#{bin}/kubebay", "--help"
  end
end
