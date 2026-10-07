cask "apprec" do
  version "0.2.0"
  sha256 "d1ab298bfed828f4d1895fbf45821c973290810a171d79874d10e803355a76cd"

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
