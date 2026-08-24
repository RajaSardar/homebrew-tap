class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "bff4c3a17ade7ae41adb0d96abac6bd1c723b55df51d91971bea72d2c47ccfd8"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "a24b7ce1e629c599f18c1c7a3d1764a8867d9ce41789a725edcef729bc613270"
    end
  end
  on_linux do
    url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
    sha256 "f4e7a2aae40d39460467388b255dffd4d0a15d1ddb39d2656a92219016f98aa8"
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
