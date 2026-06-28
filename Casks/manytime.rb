cask "manytime" do
  version "1.2.0"
  sha256 "9f2de9a70a18eb261af717593dac6b83c8e42c7f5377fb9b6c01998fdf0636a5"

  url "https://codeberg.org/dmurtari/ManyTime/releases/download/#{version}/ManyTime-#{version}.zip"
  name "ManyTime"
  app "ManyTime.app"

  postflight do
    system_command "/usr/bin/xattr",
                  args: ["-dr", "com.apple.quarantine", "#{appdir}/ManyTime.app"]
    system_command "/usr/bin/codesign",
                  args: ["--force", "--deep", "--sign", "-", "#{appdir}/ManyTime.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.dmurtari.ManyTime.plist",
  ]
end
