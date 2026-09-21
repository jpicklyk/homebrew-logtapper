cask "logtapper" do
  arch arm: "aarch64", intel: "x64"

  version "0.13.2"
  sha256 arm:   "c5739a8cf72e653f18334096b2b9dcbb116ae42ca4baea0311084c9254670561",
         intel: "a941717abc258f2896c63f49516f8481e1d7b7d49bdf8d2c032a7e24d2d900b7"

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
