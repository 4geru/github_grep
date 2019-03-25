require "github_grep/version"
require "github_grep/parser"
require "github_grep/command"
require 'pry'

module GithubGrep
  def self.run(argv)
    parser = GithubGrep::Parser.new(ARGV)
    GithubGrep::Command.run(parser)
  end
end
