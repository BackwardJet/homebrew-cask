cask "unity-ios-support-for-editor" do
  version "2023.1.7f1,4f4e359ec3fc"
  sha256 "0e9f1a6fc479e8faae9a00ff30a37be3f4e9279830460bd687cbac2b13649868"

  url "https://download.unity3d.com/download_unity/#{version.csv.second}/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-#{version.csv.first}.pkg",
      verified: "download.unity3d.com/download_unity/"
  name "Unity iOS Build Support"
  desc "iOS target support for Unity"
  homepage "https://unity.com/products"

  livecheck do
    url "https://public-cdn.cloud.unity3d.com/hub/prod/releases-darwin.json"
    regex(%r{
        /download_unity/(\h+)/MacEditorTargetInstaller
        /UnitySetup-iOS-Support-for-Editor-(\d+(?:\.\d+)+[a-z]*\d*)\.pkg
      }ix)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[1]},#{match[0]}" }
    end
  end

  depends_on cask: "unity"

  pkg "UnitySetup-iOS-Support-for-Editor-#{version.csv.first}.pkg"

  uninstall pkgutil: "com.unity3d.iOSSupport"
end
