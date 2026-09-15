cask "manytime" do
  version "1.5.2"
  sha256 "9f48366c20edff2348bc96f9da2430637535f8ae21a5ce4f8ba28ed69fbcdcc8"

  url "https://codeberg.org/dmurtari/ManyTime/releases/download/#{version}/ManyTime-#{version}.zip"
  name "ManyTime"
  homepage "https://codeberg.org/dmurtari/ManyTime"

  depends_on :macos

  app "ManyTime.app"

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ManyTime.app"]
      run "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "{{appdir}}/ManyTime.app"]
    end
  end

  zap trash: "~/Library/Preferences/com.dmurtari.ManyTime.plist"
end
