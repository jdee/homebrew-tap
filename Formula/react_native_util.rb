# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ReactNativeUtil < Formula
  desc "Community utility CLI for React Native projects"
  homepage "https://github.com/jdee/react_native_util"
  url "https://github.com/jdee/react_native_util/archive/v0.1.3.tar.gz"
  sha256 "6cab78efc8739fa801f6250c38b2f3c6bfd6783ebc58e7e395b3f42c6bd391c2"

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
