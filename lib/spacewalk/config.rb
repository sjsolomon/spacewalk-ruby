module Spacewalk
  CONFIG_OPTIONS = {
    host: '',
    user: '',
    password: '',
    http_verify: 'true'
  }.freeze
  # Document here TODO: Make sure to update this documentation
  class Config
    def initialize(**opts)
      options = opts
      CONFIG_OPTIONS.each do |name, value|
        instance_variable_set "@#{name}", options.fetch(name, value)
      end
    end
  end
end
