cask "wowow" do
  version "0.3.0"
  sha256 arm:   "4e9bbaa3e23f7e954490d9cb5393868db41126971c19bcf3be45b59cb5998e28",
         intel: "568fa17761b71c24a48fbb5df3b278c7cceb9b7dc61ccb811e63463cb30b9565"

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


  depends_on macos: ">= :big_sur"

  app "Wowow Browser.app"

  zap trash: [
    "~/Library/Application Support/wowow-browser",
    "~/Library/Preferences/dev.wowow.browser.plist",
    "~/Library/Saved Application State/dev.wowow.browser.savedState",
  ]
end
