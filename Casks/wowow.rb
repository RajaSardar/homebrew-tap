cask "wowow" do
  version "0.3.1"
  sha256 arm:   "200ed729dc226d525c23c8924d2ec2c77d73d8201cd1162bccbb771ea4688394",
         intel: "07151069c7e329374ddeae2b55f961937d9ac8ae65a1f0b699816b0803d4d4c6"

  on_arm do
    url "https://github.com/RajaSardar/wowow-browser/releases/download/v#{version}/Wowow-Browser-#{version}-arm64.dmg"
  end
  on_intel do
    url "https://github.com/RajaSardar/wowow-browser/releases/download/v#{version}/Wowow-Browser-#{version}.dmg"
  end

  name "Wowow Browser"
  desc "Agentic browser with a built-in AI agent that operates the web"
  homepage "https://github.com/RajaSardar/wowow-browser"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Wowow Browser.app"

  zap trash: [
    "~/Library/Application Support/wowow-browser",
    "~/Library/Preferences/dev.wowow.browser.plist",
    "~/Library/Saved Application State/dev.wowow.browser.savedState",
  ]
end
