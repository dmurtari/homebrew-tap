cask "manytime" do
  version "1.5.1"
  sha256 "d93b14e2d16b9742085361e36da0cad10892d3ec42859e435ccef02e4982b65a"

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
