# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ReactNativeUtil < Formula
  desc "Community utility CLI for React Native projects"
  homepage "https://github.com/jdee/react_native_util"
  url "https://github.com/jdee/react_native_util/archive/v0.3.0.tar.gz"
  sha256 "abfdf521a1ff7121bedddc841ef4df85212b44b829bafd749de1d67f04d48684"

  # Minimum required CocoaPods version.
  depends_on "cocoapods" => "1.6.0"
  # Ensure the rest of the toolchain is present.
  depends_on "yarn" => "1.0"
  # brew install jdee/tap/react_native_util --with-react-native-cli to install
  # the RN CLI as well. This is not the default.
  depends_on "react-native-cli" => ["2.0", :optional]

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "react_native_util.gemspec"
    system "gem", "install", "react_native_util-#{version}.gem"
    bin.install libexec/"bin/react_native_util", libexec/"bin/rn"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"], :REACT_NATIVE_UTIL_INSTALLED_FROM_HOMEBREW => "true")
  end

  test do
    system "#{bin}/rn", "-h"
  end
end
