class Kubebay < Formula
  desc "Local-first Kubernetes IDE — engine + web UI in one binary"
  homepage "https://github.com/RajaSardar/kubebay"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-arm64.tar.gz"
      sha256 "5ea7dc54fb53e53865e807cc6ab2c22b05faec9c56b8e5d4f9514a69823543fd"
    else
      url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-darwin-amd64.tar.gz"
      sha256 "887bbc477811e323622c5fe71876945b1ad09e2d35f2bbd1bb92f3f6cb798abd"
    end
  end
  on_linux do
    url "https://github.com/RajaSardar/kubebay/releases/download/v#{version}/kubebay-linux-#{Hardware::CPU.arm? ? "arm64" : "amd64"}.tar.gz"
    sha256 "2104b1af420b03cfc034a12386e82e6b0c963b3d11ce11b1259ae83b5e19cc7d"
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
