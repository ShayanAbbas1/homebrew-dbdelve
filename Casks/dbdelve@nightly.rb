cask "dbdelve@nightly" do
  version "0.7.4-nightly.20261116.42"
  sha256 "cc171cd97e5ddd76c7cf7787d57ee963f76aa620bd6e7eed3a5eca2576b2d658"

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
