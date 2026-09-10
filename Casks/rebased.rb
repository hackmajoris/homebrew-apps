cask "rebased" do
  version "1.0.1"

  on_macos do
    arch arm: "-aarch64"

    sha256 arm:   "971648c66d7c30d3b89723f83a1fc014d3c5109922611900684e50f83a3a2024",
           intel: "342bab2d833b09f648f33cb6b1826fa200307a1be46246ab4eb7d0e4bd7600a2"

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
