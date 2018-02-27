module Spacewalk
  # TODO: document here
  module API
    def query(**opts)
      puts "My auth key is #{@auth_key}"
      puts self.auth_key
    end
    # machine_spacewalk_id = @spacewalk_connection.call('system.getId', @spacewalk_connection_key, @device_name)
  end
end