cask "rebased" do
  version "1.0.0"

  on_macos do
    arch arm: "-aarch64", intel: ""

    sha256 arm:   "8d0f0dddeab4779b8bed10f115cb4ce7c73c928efb6996f659c867ae1d3c6ad1",
           intel: "a6c83cea78618847fc4d84aadb093724ccae3dd1f7d7768d8e62298d5c9cd127"

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
