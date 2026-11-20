cask "dbdelve@nightly" do
  version "0.7.4-nightly.20261120.48"
  sha256 "b61f4b09a1fde333ca5b785c636e49bcacda9a21af9ac5cc47b8ef89349cf44f"

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
