class Kubebay < Formula
  desc "Kubernetes UI with real-time terminal access and pod management"
  homepage "https://github.com/RajaSardar/kubebay"
  url "https://github.com/RajaSardar/kubebay/releases/download/v0.4.0/Kubebay-v0.4.0-aarch64-apple-darwin.zip"
  sha256 "49a83bc731bcb6945714c66964381f4b880ba1a6c05303352008e6b28cb1b75f"
  version "0.4.0"
  license "Apache-2.0"

  depends_on :macos

  def install
    app = "Kubebay.app"
    # Check if we need to go into nested structure
    if (buildpath/app).directory?
      app_path = buildpath/app
    elsif (buildpath/"Kubebay.app/Kubebay.app").directory?
      app_path = buildpath/"Kubebay.app/Kubebay.app"
    else
      raise "Kubebay.app not found"
    end
    
    cp_r app_path, prefix/"Kubebay.app"
    bin.write_exec_script "#{prefix}/Kubebay.app/Contents/MacOS/kubebay"
  end

  def caveats
    <<~EOS
      Kubebay has been installed. Launch it with:
        open #{prefix}/Kubebay.app
      
      Or from the command line:
        kubebay
    EOS
  end

  test do
    system "#{bin}/kubebay", "--help"
  end
end
