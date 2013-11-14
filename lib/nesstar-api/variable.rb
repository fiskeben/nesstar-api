require 'nesstar-api/nesstar-object.rb'
require 'nesstar-api/category.rb'

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

  def discrete?
    metadata['intrvl'] == 'discrete'
  end

  def continuous?
    metadata['intrvl'] == 'continuous'
  end

  def weighted?
    metadata['wgt']
  end

  def get_categories
    metadata['catgry'].collect do | category |
      Category.new category
    end
  end

end