require 'nesstar-api/nesstar-object.rb'
require 'nesstar-api/category.rb'

##
# Represents a variable in a +Study+.
class Variable < NesstarObject
  attr_reader :id, :name, :label

  def initialize(data, eager = false)
    @id = data['id']
    @name = data['name']
    @label = data['label']
    if eager
      load_metadata
    end
  end

  ##
  # Indicates whether the variable is discrete.
  def discrete?
    metadata['intrvl'] == 'discrete'
  end

  ##
  # Indicates whether the variable is continuous.
  def continuous?
    metadata['intrvl'] == 'continuous'
  end

  ##
  # Indicates whether this is a weight variable
  def weighted?
    metadata['wgt']
  end

  ##
  # Returns a list of categories in this variable
  def get_categories
    metadata['catgry'].collect do | category |
      Category.new category
    end
  end
end