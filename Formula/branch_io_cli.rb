# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class BranchIoCli < Formula
  desc "Branch.io command line interface"
  homepage "https://github.com/BranchMetrics/branch_io_cli"
  url "https://github.com/BranchMetrics/branch_io_cli/archive/v0.12.9.tar.gz"
  sha256 "611f58cb7abf658bb6f3c20a36799ca5cd2fd28f5bff791683a61e021fdbcfb5"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "branch_io_cli.gemspec"
    system "gem", "install", "branch_io_cli-#{version}.gem"
    bin.install libexec/"bin/branch_io", libexec/"bin/br"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"], :BRANCH_IO_CLI_INSTALLED_FROM_HOMEBREW => "true")
  end

  test do
    system "#{bin}/br", "-h"
  end
end
