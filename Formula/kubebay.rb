class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.7.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "ccc6a96078c26d04539d231b3cfb0abdccc774d1db435676027c491d510cc7ea"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "9350258e7ec3e1051e9c6b0f0ba0c97ab86cad0bf36dc63a9f6098293314f7e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-arm64.tar.gz"
      sha256 "8163964ead3b01f5848105f7c955d42f14dd505a4da5c45b79bae35113a1ce4e"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-amd64.tar.gz"
      sha256 "2b19bef3f841ce673fa35414beea7c82d850416077544fbebd973ab334d1bbff"
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
