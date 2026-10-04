cask "dbdelve" do
  version "0.3.0"
  sha256 "2a619c8b73af8a3e7de7349064eb6a1dcd30dcc1295e9db27c6ffbaa81db60f3"

  url "https://github.com/ShayanAbbas1/dbdelve/releases/download/v#{version}/DBDelve-#{version}.dmg"
  name "DBDelve"
  desc "Native SQL client"
  homepage "https://github.com/ShayanAbbas1/dbdelve"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "DBDelve.app"

  # Lowercase: the app writes "dbdelve", and a zap spelled any other way
  # silently removes nothing. Saved passwords live in the Keychain, which zap
  # cannot reach at all.
  zap trash: "~/Library/Application Support/dbdelve"
end
