require 'nesstar-api/rest-client.rb'
require 'nesstar-api/server.rb'

module NesstarAPI
  def self.get_server(url)
    RestClient.instance.init url
    Server.new
  end
end