cask "dbdelve@nightly" do
  version "0.7.4-nightly.20261117.44"
  sha256 "f8b0462aa05029eb9a050bca5e9ffea639b84a0d2b5e1280935cd5bb91b84b75"

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
