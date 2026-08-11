cask "manytime" do
  version "1.5.0"
  sha256 "22a127a33b5a60055418125e16f282d10620bbdbd6d58f4fe0b1a9ac2a40fce4"

  url "https://codeberg.org/dmurtari/ManyTime/releases/download/#{version}/ManyTime-#{version}.zip"
  name "ManyTime"
  homepage "https://codeberg.org/dmurtari/ManyTime"

  depends_on :macos

  app "ManyTime.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ManyTime.app"]
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/ManyTime.app"]
  end

  zap trash: "~/Library/Preferences/com.dmurtari.ManyTime.plist"
end
