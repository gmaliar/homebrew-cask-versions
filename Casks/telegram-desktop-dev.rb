cask "telegram-desktop-dev" do
  version "2.4.9.beta"
  sha256 "406f5ce7d51fe968323555962f373ed1aeb2e6417015707a03a7e7e185cb7ccb"

  # github.com/telegramdesktop/tdesktop/ was verified as official when first introduced to the cask
  url "https://github.com/telegramdesktop/tdesktop/releases/download/v#{version.major_minor_patch}/tsetup.#{version}.dmg"
  appcast "https://github.com/telegramdesktop/tdesktop/releases.atom",
          must_contain: version.major_minor_patch
  name "Telegram Desktop"
  homepage "https://desktop.telegram.org/"

  auto_updates true
  conflicts_with cask: "telegram-desktop"

  # Renamed to avoid conflict with telegram
  app "Telegram.app", target: "Telegram Desktop.app"

  zap trash: [
    "~/Library/Application Support/Telegram Desktop",
    "~/Library/Preferences/com.tdesktop.Telegram.plist",
    "~/Library/Saved Application State/com.tdesktop.Telegram.savedState",
  ]
end
