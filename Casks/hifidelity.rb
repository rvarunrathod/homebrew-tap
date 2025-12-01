cask "hifidelity" do
  version "1.0.2"
  sha256 "b039d58b38efc79353c674775a9eea914998ab5fa39d70ea4265a73c95ecf243"

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

  caveats do
    unsigned_accessibility
  end

  zap trash: [
    "~/Library/Containers/vr.HiFidelity"
  ]
end
