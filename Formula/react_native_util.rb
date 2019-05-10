# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ReactNativeUtil < Formula
  desc "Community utility CLI for React Native projects"
  homepage "https://github.com/jdee/react_native_util"
  url "https://github.com/jdee/react_native_util/archive/v0.1.2.tar.gz"
  sha256 "e00338fea3af3f6256d881219ae7ac1cdb0b81578d8dfa9154fcdc86db7f7a5f"

  # Minimum required CocoaPods version.
  depends_on "cocoapods" => "1.6.0"
  # Ensure yarn is present.
  depends_on "yarn" => "1.0"

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
