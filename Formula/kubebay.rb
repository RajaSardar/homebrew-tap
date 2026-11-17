class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.7.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "0f5bb3db924b9633a155660278d9ca82099c1bfbcb19cda5e32c33b5f81aa2fd"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "77eb6340d179d250275cc20442bc644316fe2ae1e518414a8a59fec36389b4e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-arm64.tar.gz"
      sha256 "5e3a245b4c28b219774c72b83d5b27e819322fcf38fa294b57b44f4085f0aa9a"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-amd64.tar.gz"
      sha256 "6ee32dfd5580b2b321f6672d9506032cadbb9cb01cdaf66ace091eab2c7fe26c"
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
