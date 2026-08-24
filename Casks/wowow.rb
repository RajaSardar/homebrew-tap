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
<<<<<<< HEAD
  desc "Open-source agentic browser with a built-in AI agent that can see and operate the web"
=======
  desc "Agentic browser with a built-in AI agent that operates the web"
>>>>>>> 0a74da1c403311c5b6f893e8aa0809c49d95eab9
  homepage "https://github.com/RajaSardar/wowow-browser"

  livecheck do
    url :url
    strategy :github_latest
  end

<<<<<<< HEAD
  auto_updates false
  depends_on mac: ">= :catalina"
=======

  depends_on macos: :big_sur
>>>>>>> 0a74da1c403311c5b6f893e8aa0809c49d95eab9

  app "Wowow Browser.app"

  zap trash: [
    "~/Library/Application Support/wowow-browser",
    "~/Library/Preferences/dev.wowow.browser.plist",
    "~/Library/Saved Application State/dev.wowow.browser.savedState",
  ]
end
