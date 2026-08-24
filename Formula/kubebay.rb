class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end
  on_linux do
    url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    bin.install "kubebay"
  end

  service do
    run [bin/"kubebay", "--addr", "127.0.0.1:9898", "--no-open"]
    keep_alive true
  end

  def caveats
    <<~EOS
      Run directly:  kubebay
      As a service:  brew services start rajasardar/tap/kubebay
      The UI token is printed on first start.
    EOS
  end
end
