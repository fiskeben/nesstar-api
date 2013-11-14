require 'nesstar-api/nesstar-object.rb'

class Category < NesstarObject
  attr_reader :id, :name, :label, :frequency

  def initialize(data)
    @label = data['label']
    @value = data['value']
    @frequency = data['frequency']
    @missing = data['missing'] == 'true'
  end

  def missing?
    @missing
  end
end