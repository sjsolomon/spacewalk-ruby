module Spacewalk
  # Document here TODO: Actually document this
  class Client
   include Spacewalk::Api

    def initialize(**opts)
      @config = Spacewalk::Config.new(opts)
    end
  end
end