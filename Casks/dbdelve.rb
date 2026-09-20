cask "dbdelve" do
  version "0.1.0"
  sha256 "80e55769e0f150a11e411a6538232fa5ddc9b819c9aa81e071d4529427590c56"

  url "https://github.com/ShayanAbbas1/dbdelve/releases/download/v#{version}/DBDelve-#{version}.dmg"
  name "DBDelve"
  desc "Native macOS SQL client"
  homepage "https://github.com/ShayanAbbas1/dbdelve"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "DBDelve.app"

  # Lowercase: the app writes "dbdelve", and a zap spelled any other way
  # silently removes nothing. Saved passwords live in the Keychain, which zap
  # cannot reach at all.
  zap trash: "~/Library/Application Support/dbdelve"
end
