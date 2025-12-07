cask "hifidelity" do
  version "1.0.4"
  sha256 "635279885c7221466c855ae997e221f87ba8b6cd842410897d9068a430f6748c"

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
