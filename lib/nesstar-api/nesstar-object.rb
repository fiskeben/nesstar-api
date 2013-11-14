require 'nesstar-api/rest-client.rb'

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

  def dig(hash, *path)
    if (path.length == 1)
      hash[path.pop.to_s]
    elsif hash.respond_to?(:keys)
      key = path.shift.to_s
      dig(hash[key], *path)
    end
  end
end