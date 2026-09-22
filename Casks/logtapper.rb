cask "logtapper" do
  arch arm: "aarch64", intel: "x64"

  version "0.13.3"
  sha256 arm:   "e9a6773613940d3a341a799c5a3127957d8498c187eeabfea5c4b6597d19a43b",
         intel: "57778e3cd311dd000739ca27977f78b7bd82c9bba9d552fdcb83e485062bba0f"

  url "https://github.com/jpicklyk/LogTapper/releases/download/v#{version}/LogTapper_#{version}_#{arch}.dmg"
  name "LogTapper"
  desc "Android log file analyzer with AI-assisted analysis"
  homepage "https://github.com/jpicklyk/LogTapper"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :catalina

  app "LogTapper.app"

  uninstall quit: "io.github.jpicklyk.logtapper"

  zap trash: [
    "~/Library/Application Support/io.github.jpicklyk.logtapper",
    "~/Library/Caches/io.github.jpicklyk.logtapper",
    "~/Library/Preferences/io.github.jpicklyk.logtapper.plist",
    "~/Library/Saved Application State/io.github.jpicklyk.logtapper.savedState",
    "~/Library/WebKit/io.github.jpicklyk.logtapper",
  ]

  caveats <<~EOS
    LogTapper is not yet notarized by Apple. Either install with
      brew install --cask --no-quarantine jpicklyk/logtapper/logtapper
    or, after installing, clear the quarantine flag once:
      xattr -d -r com.apple.quarantine /Applications/LogTapper.app
  EOS
end
