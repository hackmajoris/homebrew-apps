cask "rebased" do
  version "1.1.0"

  on_macos do
    arch arm: "-aarch64"

    sha256 arm:   "69ac4c6443d0391b1295d03d14c2593ab155ebdfd72318239c297603935fe4cd",
           intel: "dd89fac39909bb15f3c124894196151df21f41bacc0c34fcbbf8f8b2a5fcffd5"

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
