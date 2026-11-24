cask "dbdelve@nightly" do
  version "0.7.4-nightly.20261124.52"
  sha256 "d4be94beeeed4aa3ec6f2cf2ce41f241bfdeb0c9c1ba4fac3ba7fdb11158049e"

  url "https://github.com/ShayanAbbas1/dbdelve/releases/download/v#{version}/DBDelve-Nightly-#{version}.dmg"
  name "DBDelve Nightly"
  desc "Fast, native, multi-engine database client"
  homepage "https://github.com/ShayanAbbas1/dbdelve"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "DBDelve Nightly.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DBDelve Nightly.app"]
  end

  zap trash: [
    "~/Library/Application Support/dbdelve-nightly",
    "~/Library/Logs/dbdelve-nightly",
  ]
end
