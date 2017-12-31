# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class BranchIoCli < Formula
  desc "Branch.io command line interface"
  homepage "https://github.com/BranchMetrics/branch_io_cli"
  # url "https://github.com/BranchMetrics/branch_io_cli/archive/v0.12.7.tar.gz"
  url "file:///Users/jdee/github/BranchMetrics/branch_io_cli-0.13.0.pre.1.tar.gz"
  # sha256 "9264044d678db7336d0c7b0f8d2456dc9e3ba4f416c8f358a2587d7844af8a98"
  sha256 "991f7517bd918add904a0dd5e41a0ab874d622690c73c41b10ddde890bcad152"

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
