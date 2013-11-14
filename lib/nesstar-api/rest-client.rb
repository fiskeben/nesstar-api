require 'json'
require 'net/http'
require 'uri'
require 'singleton'

class RestClient
  include Singleton

  def init(url)
    unless url =~ /\//
      url = url + '/'
    end
    @@url = url
  end

  def get_values(path)
    url = @@url + path
    uri = URI.parse url
    response = Net::HTTP.get_response uri
    json = JSON.parse response.body
    json['payload']
  end
end