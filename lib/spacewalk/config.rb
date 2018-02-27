module Spacewalk
  CONFIG_OPTIONS = {
    host: 'localhost',
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
      @auth_key = open_connection
    end

    private
    def open_connection
      conn_opts = XMLRPC::Client.new2("https://#{@host}/rpc/api")
      conn_opts.http.verify_mode = OpenSSL::SSL::VERIFY_NONE unless @http_verify
      conn_opts.call('auth.login', @user, @password)
    end
  end
end
