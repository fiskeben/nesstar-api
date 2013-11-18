require 'nesstar-api/rest-client.rb'

##
# A parent class for all Nesstar objects.
class NesstarObject

  private

  def load_metadata
    path = "#{self.class.name.downcase}/#{@id}"
    @@data ||= get_values path
  end

  def metadata
    load_metadata
  end

  def get_values(path)
    RestClient.instance.get_values path
  end

  def get_binary(path, &block)
    RestClient.instance.get_binary(path, &block)
  end

  def dig(hash, *path)
    if hash.nil?
      nil
    elsif path.length == 1
      hash[path.pop.to_s]
    elsif hash.respond_to?(:keys)
      key = path.shift.to_s
      dig(hash[key], *path)
    end
  end
end