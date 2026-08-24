class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "277c96db6a0347cae9cc1a879c9a9808cf654fc31860dead3e0d0474e13fa9d7"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "5f34b67c38efac69e8a0e9761e71a0755d81f9da5788411b8099713b319993c8"
    end
  end
  on_linux do
    url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
    sha256 "19839eef100c50cbcb46d77cb5c9d1fe109e6b7d841b7003ca556b09b9ae385b"
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
