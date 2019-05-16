# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class BranchIoCli < Formula
  VERSION = '0.13.1'

  desc "Branch.io command line interface"
  homepage "https://github.com/BranchMetrics/branch_io_cli"
  url "https://github.com/BranchMetrics/branch_io_cli/archive/v#{VERSION}.tar.gz"
  sha256 "9ee05732198750d0f5fe423a7d3d076581052cb4e40d948dd6c1b5957abaf925"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "branch_io_cli.gemspec"
    system "gem", "install", "branch_io_cli-#{version}.gem"
    bin.install libexec/"bin/branch_io", libexec/"bin/br"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"], :BRANCH_IO_CLI_INSTALLED_FROM_HOMEBREW => "true")
  end

  bottle do
    root_url "https://github.com/jdee/homebrew-tap/releases/download/branch_io_cli-v#{VERSION}"
    cellar :any_skip_relocation
    sha256 "c0f3564cec355b1ad105b85f2e2dd387e85309408a01f22a609ea8442f81551b" => :mojave
  end

  test do
    system "#{bin}/br", "-h"
  end
end
