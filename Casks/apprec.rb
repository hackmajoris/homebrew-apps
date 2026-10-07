cask "apprec" do
  version "0.3.0"
  sha256 "330c040c66688f5f1bd936d3a381cf6b2c7fd963032b661c1c20a9eb49d9e1d4"

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
