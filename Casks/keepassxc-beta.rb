cask "keepassxc-beta" do
  version "2.6.2"

  if MacOS.version <= :sierra
    # github.com/keepassxreboot/keepassxc/ was verified as official when first introduced to the cask
    url "https://github.com/keepassxreboot/keepassxc/releases/download/#{version}/KeePassXC-#{version}-Sierra.dmg"
    sha256 "7cd8dc34022091c240e538f7a9889afd7dc8f9f3957a66bca9d70c067045ade4"
  else
    # github.com/keepassxreboot/keepassxc/ was verified as official when first introduced to the cask
    url "https://github.com/keepassxreboot/keepassxc/releases/download/#{version}/KeePassXC-#{version}.dmg"
    sha256 "29bfaf99f2c8a47063b2da0b67054f10c90cafe248db84411a26ecc974711ba7"
  end

  appcast "https://github.com/keepassxreboot/keepassxc/releases.atom"
  name "KeePassXC"
  homepage "https://keepassxc.org/"

  conflicts_with cask: "keepassxc"
  depends_on macos: ">= :sierra"

  app "KeePassXC.app"
  binary "#{appdir}/KeePassXC.app/Contents/MacOS/keepassxc-cli"

  zap trash: [
    "~/.keepassxc",
    "~/Library/Application Support/keepassxc",
    "~/Library/Caches/org.keepassx.keepassxc",
    "~/Library/Preferences/org.keepassx.keepassxc.plist",
    "~/Library/Saved Application State/org.keepassx.keepassxc.savedState",
    "~/Library/Logs/DiagnosticReports/KeePassXC_*.crash",
    "~/Library/Application Support/CrashReporter/KeePassXC_*.plist",
  ]
end
