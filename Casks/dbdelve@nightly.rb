cask "dbdelve@nightly" do
  version "0.8.1-nightly.20261125.54"
  sha256 "13a25c8be23942dea0f31be5dd3550ad00f434dd9d67cc5333455773e2245ddf"

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
