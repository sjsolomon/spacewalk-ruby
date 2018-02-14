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
      connection = XMLRPC::Client.new2("https://#{@host}/rpc/api")
      connection.http.verify_mode = OpenSSL::SSL::VERIFY_NONE unless @http_verify
      @sw_key = connection.call('auth.login', @user, @password)
    end
  end
end
