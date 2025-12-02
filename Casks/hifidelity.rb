cask "hifidelity" do
  version "1.0.3"
  sha256 "38323e6549fa9b9058450c2b51c510cdcfc93d22a8cd0faaf068ad457aa6a68b"

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
