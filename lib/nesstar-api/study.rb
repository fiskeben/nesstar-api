require 'nesstar-api/nesstar-object.rb'
require 'nesstar-api/variable.rb'
require 'nesstar-api/variable-group.rb'
require 'nesstar-api/variable-container.rb'

class Study < NesstarObject
  attr_reader :id, :name, :abstract
  @@child_type = 'variable-groups'

  include VariableContainer

  def initialize(data)
    @id = data['id']
    @name = data['name']
    @abstract = data['abstract']
    @last_update = data['updatedTimeStamp']
  end

  def tabulate
  end

  def correlate
  end

  def regress
  end

  def download
  end

  private

  def get_variable_group_type
    @@child_type
  end
end