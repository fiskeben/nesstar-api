require 'nesstar-api/rest-client.rb'
require 'nesstar-api/server.rb'

##
# This module is the starting point. Use this to get an instance of a server.
module NesstarAPI

  ##
  # Gets a server identified by a URL
  def self.get_server(url)
    RestClient.instance.init url
    Server.new
  end
end