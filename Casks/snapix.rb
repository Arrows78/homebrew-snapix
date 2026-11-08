cask "snapix" do
  version "1.2.0"
  sha256 "8c4032d4483fc842b2a09090eada91ead4d7280bd718ead558c4ebd60c617de4"

  url "https://github.com/Arrows78/Snapix/releases/download/v#{version}/Snapix-#{version}.zip"
  name "Snapix"
  desc "Menu-bar screenshot, annotation and OCR tool"
  homepage "https://github.com/Arrows78/Snapix"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Snapix.app"

  # Your own files are never removed.
  zap trash: [
    "~/Library/Application Support/Snapix",
    "~/Library/Preferences/com.labs.snapix.plist",
  ]

  caveats <<~EOS
    Snapix is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open System Settings > Privacy & Security and click "Open Anyway",
    or run: xattr -dr com.apple.quarantine /Applications/Snapix.app
  EOS
end
