cask "snapix" do
  version "1.0.0"
  sha256 "5671253368ba692b8fbed74c4e45028703314a006d6d26cf96a1b18961675408"

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
