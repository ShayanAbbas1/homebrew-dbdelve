cask "dbdelve" do
  version "0.7.2"
  sha256 "9da8c240f1f25361f82e69ecd22ac687a96e997ab2a7693081c3deed4d4f91e0"

  url "https://github.com/ShayanAbbas1/dbdelve/releases/download/v#{version}/DBDelve-#{version}.dmg"
  name "DBDelve"
  desc "Fast, native, multi-engine database client"
  homepage "https://github.com/ShayanAbbas1/dbdelve"

  # The app updates itself, so Homebrew leaves upgrading it to the app.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "DBDelve.app"

  # Ad-hoc signed and not notarized, so Gatekeeper refuses the app
  # until its quarantine flag is cleared. Done here so a Homebrew
  # install opens without the xattr command a manual one needs.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DBDelve.app"]
  end

  # Lowercase: the app writes "dbdelve", and a zap spelled any other way
  # silently removes nothing. Saved passwords live in the Keychain, which zap
  # cannot reach at all.
  zap trash: "~/Library/Application Support/dbdelve"
end
