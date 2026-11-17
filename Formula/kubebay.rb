class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.7.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "9fa04d5abcee411c36f9067c4d25e437c709881d0ce62c16268bdf8b4f4869ab"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "2d8e9bf67243a53f607f1c742343947a49bfb2ed931c6819f40549f06f00e4a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-arm64.tar.gz"
      sha256 "fc64521c07be99550f9083a3f293e15a8f76be1268ace160e3444c19e288f6e6"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-amd64.tar.gz"
      sha256 "20b46a1a01c23dd09b381977e35391fc40c5fb00d025b95fcf133b21a2cfdb3f"
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
