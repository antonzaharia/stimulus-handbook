require 'net/http'
module MainHelper
  class Joke
    def initialize
      @joke = get_joke
    end
    attr_reader :joke

    def setup
      joke['setup']
    end

    def delivery
      joke['delivery']
    end

    def oneliner?
      joke['joke'].present?
    end

    def oneliner
      joke['joke']
    end

    def get_joke
      uri = URI("https://v2.jokeapi.dev/joke/Any?safe-mode")
      response = Net::HTTP.get(uri)
      @joke ||= JSON.parse(response)
    end
  end
end
