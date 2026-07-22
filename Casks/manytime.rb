cask "manytime" do
  version "1.3.0"
  sha256 "ad87ca0e39f520c6f8dcf36c886b4b96987228c6092336828940b0960c7e6130"

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
