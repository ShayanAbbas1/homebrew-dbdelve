cask "dbdelve" do
  version "0.5.0"
  sha256 "9dfa68f1d38bc5bce24a249a8d5532a6c9e21d89f6eeb324c606088a58e55c1a"

  url "https://github.com/ShayanAbbas1/dbdelve/releases/download/v#{version}/DBDelve-#{version}.dmg"
  name "DBDelve"
  desc "Fast, native, multi-engine database client"
  homepage "https://github.com/ShayanAbbas1/dbdelve"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "DBDelve.app"

  # Lowercase: the app writes "dbdelve", and a zap spelled any other way
  # silently removes nothing. Saved passwords live in the Keychain, which zap
  # cannot reach at all.
  zap trash: "~/Library/Application Support/dbdelve"
end
