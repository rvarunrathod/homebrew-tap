cask "hifidelity" do
  version "1.0.8"
  sha256 "b9c51528b55f76cb6752af436e91524755b5c2e025dbd4a4b838d8fa6593bd70"

  url "https://github.com/rvarunrathod/HiFidelity/releases/download/v#{version}/HiFidelity-#{version}-Universal.dmg"
  name "HiFidelity"
  desc "A offline music player for macOS"
  homepage "https://github.com/rvarunrathod/HiFidelity"

  livecheck do
    url "https://github.com/rvarunrathod/HiFidelity/releases/latest"
    strategy :github_latest
  end
  
  auto_updates true
  depends_on macos: ">= :sonoma"

  app "HiFidelity.app"

  postflight do
    # Remove quarantine attribute before moving the app
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{staged_path}/HiFidelity.app"]
  end
  
  caveats do
    unsigned_accessibility
  end

  zap trash: [
    "~/Library/Containers/vr.HiFidelity"
  ]
end
