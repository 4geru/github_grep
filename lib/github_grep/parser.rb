require "optparse"

module GithubGrep
  class Parser
    def initialize(argvs)
      opt = OptionParser.new
      @params = {}

      opt.on('-l', '--files-with-matches') {|v| @params[:'files-with-matches'] = v }

      @argvs = opt.parse!(argvs)      
    end

    def argvs
      @argvs
    end

    def params
      @params
    end
  end
end