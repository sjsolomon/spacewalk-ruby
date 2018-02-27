module Spacewalk
  # Document here TODO: Actually document this
  class Client
    include Spacewalk::API

    def initialize(**opts)
      @config = Spacewalk::Config.new(opts)
    end
  end
end