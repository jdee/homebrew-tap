# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ReactNativeUtil < Formula
  VERSION = '0.6.0'

  desc "Community utility CLI for React Native projects"
  homepage "https://github.com/jdee/react_native_util"
  url "https://github.com/jdee/react_native_util/archive/v#{VERSION}.tar.gz"
  sha256 "a1c2273c0d4bfb6658ee4ecd176ac19c881ec6484cbe6dfbad0369512064e95f"

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

  bottle do
    root_url "https://github.com/jdee/homebrew-tap/releases/download/react_native_util-v#{VERSION}"
    cellar :any_skip_relocation
    sha256 "ea59e435c77884951fd8c015f21639c34e5ccd0b02f65f7172617aa3300f7141" => :mojave
  end

  test do
    system "#{bin}/rn", "-h"
  end
end
