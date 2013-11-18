require 'nesstar-api/nesstar-object.rb'

##
# A category in a variable.
#
# Categories have a name, a label, and a frequency
class Category < NesstarObject
  attr_reader :name, :label, :frequency

  def initialize(data)
    @label = data['label']
    @value = data['value']
    @frequency = data['frequency']
    @missing = data['missing'] == 'true'
  end

  ##
  # Returns true if this category is missing
  def missing?
    @missing
  end
end