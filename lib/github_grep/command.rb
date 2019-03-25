require 'octokit'

module GithubGrep
  class Command
    def self.run(parser)
      result = client.search_code(parser.argvs.join('+'))

      if parser.params[:'files-with-matches']
        repository_names = result[:items]
          .map { |item| item[:repository][:name] }
          .uniq

        puts repository_names.join("\n")
      end
    end

    class << self
      private
      def client
        @client ||= Octokit::Client.new(access_token: ENV['GITHUB_API_TOKEN'])
      end
    end
  end
end