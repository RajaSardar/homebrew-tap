class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.7.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "f7d856edb8bcefb4aa19f314a6dd8283a2495025b6298577e6dee209c199eeba"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "556e0effcd20092753790a7c71fb4ad027f7147b6a68c6967c9c334db86bc693"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-arm64.tar.gz"
      sha256 "8eaabd6a88439b30b95add4e4e0ac059719213fc31abb3b5d69ed61e93ce43bc"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-amd64.tar.gz"
      sha256 "6a4d7b383d04da02bf2114bb96f4bf631466ffc397ab9d4deaad8c36ecee9fa1"
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
