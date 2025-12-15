cask "hifidelity" do
  version "1.0.6"
  sha256 "2834b449dd8f347bc16053c3f6ab321e38566b616b788d9a4f80fd9980b0e8c7"

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
