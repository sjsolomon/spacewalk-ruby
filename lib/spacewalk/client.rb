module Spacewalk
  CONFIG_OPTIONS = {
    host: 'localhost',
    user: '',
    password: '',
    http_verify: 'true'
  }.freeze

  class Client
    # Create a new connection object
    # @param host [host]
    #
    def initialize(**opts)
      options = opts
      CONFIG_OPTIONS.each do |name, value|
        instance_variable_set "@#{name}", options.fetch(name, value)
      end
      open_connection
      @auth_key = gen_auth_key
    end

    def query(**opts)
      device = opts[:device]
      query = opts[:query]

      device_id = get_system_id(device).last["id"]
      execute_query(device_id, query)
    end

    def open_connection
      @connection = XMLRPC::Client.new2("https://#{@host}/rpc/api")
      @connection.http.verify_mode = OpenSSL::SSL::VERIFY_NONE unless @http_verify
    end

    private

    def gen_auth_key
      @connection.call('auth.login', @user, @password)
    end

    def get_system_id(device)
      @connection.call('system.getId', @auth_key, device)
    end

    def execute_query(device_id, query)
      @connection.call(query, @auth_key, device_id)
    end

  end
end
