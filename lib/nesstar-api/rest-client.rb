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
    uri = get_uri(path)
    response = Net::HTTP.get_response uri
    if response.is_a? Net::HTTPServerError
      raise ServerError, parse_server_error(response.body)
    end
    json = JSON.parse response.body

    json['payload']
  end

  def get_binary(path)
    uri = get_uri(path)
    Net::HTTP.start(uri.host, uri.port) do | http |
      response = http.get(uri.request_uri)
      if response.is_a? Net::HTTPServerError
        raise ServerError, parse_server_error(response.body)
      end
      yield(response.body)
    end
  end

  private

  def get_uri(path)
    url = @@url + path
    URI.parse url
  end

  def parse_server_error(error)
    begin
      json = JSON.parse(error)
      error = json['error']
      "#{error['type']}: #{error['message']}"
    rescue JSON::ParserError
      "Fatal: Unknown server error occurred"
    end
  end

  class ServerError < StandardError
  end
end