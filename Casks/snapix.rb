cask "snapix" do
  version "1.3.0"
  sha256 "5621aa3c0a003ed37dca15cfddf4b1855152010e06ac85a2892bb362f457a30a"

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
