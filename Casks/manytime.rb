cask "manytime" do
  version "1.6.0"
  sha256 "2fddf849c0c35a171c8ab924d8717fb378d250c3699a5986fd7d94275bb954c9"

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
