cask "logtapper" do
  arch arm: "aarch64", intel: "x64"

  version "0.13.1"
  sha256 arm:   "a33ea84dd96dedf42c663555f77450f762a5a144718168fbea71850307b63aab",
         intel: "4b846cd4a7d217dcb9bacecb575453cc4fd30b3e0db01da5368cd00d4de61db4"

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
