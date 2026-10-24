cask "apprec" do
  version "0.4.0"
  sha256 "85859b6314c0ebd8678fe17563c82ebb0dfc85198eb8a62e046e6055b44e8e59"

  url "https://github.com/hackmajoris/apprec/releases/download/v#{version}/AppRec.zip"
  name "AppRec"
  desc "Menu bar recorder that transcribes and summarizes app audio on device"
  homepage "https://hackmajoris.github.io/apprec/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "AppRec.app"

  postflight_steps do
    run "xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/AppRec.app"]
  end

  uninstall quit: "com.hackmajoris.AppRec"

  zap trash: [
    "~/Library/Application Support/AppRec",
    "~/Library/Preferences/com.hackmajoris.AppRec.plist",
  ]
end
