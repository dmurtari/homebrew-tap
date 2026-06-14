cask "manytime" do
  version "1.1.0"
  sha256 "cfa22be4dbb48ad12c6ecd4d8f1c67b829611149d3e03b416add0241f33d1eb2"

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
