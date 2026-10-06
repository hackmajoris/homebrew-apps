cask "apprec" do
  version "0.1.0"
  sha256 "f7c81a94c69830a87b7989592023152e564d85b2c8c1af28406f7e45d29d11a8"

  url "https://github.com/hackmajoris/apprec/releases/download/v#{version}/AppRec.zip"
  name "AppRec"
  desc "Menu bar recorder that transcribes and summarizes app audio on device"
  homepage "https://hackmajoris.github.io/apprec/"

  livecheck do
    url :url
    strategy :github_latest
  end

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
