cask "manytime" do
  version "1.4.0"
  sha256 "e30ca919a7cfe5e8a0ef5fd6eaad77ebebf8ff7593adb0e92b7aa4414672ea46"

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
