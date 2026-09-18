cask "rebased" do
  version "1.1.1"

  on_macos do
    arch arm: "-aarch64"

    sha256 arm:   "4018d2d1777729b41b0f8e33a367b8322a3dda537c4fc5c9577958c8a9b7586a",
           intel: "fc6c80ad376ce340c4044b0c2be38f0e57d694b42371232b36f6fa335847432f"

    url "https://github.com/hackmajoris/rebased/releases/download/#{version}/rebased#{arch}.dmg"
  end

  name "Rebased"
  desc "Git client based on the IntelliJ platform"
  homepage "https://github.com/hackmajoris/rebased"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Rebased.app"

  postflight_steps do
    run "xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/Rebased.app"]
  end

  uninstall quit: "io.github.detachhead.rebased"

  zap trash: [
    "~/Library/Application Support/detachhead",
    "~/Library/Caches/detachhead",
    "~/Library/Logs/detachhead",
    "~/Library/Preferences/io.github.detachhead.rebased.plist",
    "~/Library/Saved Application State/io.github.detachhead.rebased.savedState",
  ]
end
