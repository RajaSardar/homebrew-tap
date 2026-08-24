cask "wowow" do
  version "0.3.2"
  sha256 arm:   "21cce8d7f4a5f2d41914145783afc70d27741f0ff42f053fe046caf735a81cca",
         intel: "cefb1bafa0055d7546684c7190c58c740fb6bb07edaf34b8ae4f50eff35c8f23"

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
