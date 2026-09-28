cask "logtapper" do
  arch arm: "aarch64", intel: "x64"

  version "0.14.0"
  sha256 arm:   "b5df2651c10e3a27337662eb342160b0bb56268b63ba2b43ffac0f6b3f1e8699",
         intel: "a46ebf6f9e6db7be7d9d78325c2194a343e0ad96049afe0a0059423e169965f8"

  url "https://github.com/jpicklyk/LogTapper/releases/download/v#{version}/LogTapper_#{version}_#{arch}.dmg"
  name "LogTapper"
  desc "Android log file analyzer with AI-assisted analysis"
  homepage "https://github.com/jpicklyk/LogTapper"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

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
    LogTapper is not yet notarized by Apple, so macOS reports it as damaged
    on first launch. Clear the quarantine flag once after installing:
      xattr -d -r com.apple.quarantine #{appdir}/LogTapper.app
  EOS
end
