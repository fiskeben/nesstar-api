require 'nesstar-api/nesstar-object.rb'
require 'nesstar-api/variable-container.rb'

##
# Represents a group of variables in a +Study+.
class VariableGroup < NesstarObject
  include VariableContainer

  attr_reader :id, :name

  def initialize(data)
    @id = data['id']
    @name = data['name']
  end

  private

  def get_variable_group_type
    'child-groups'
  end

  def get_rest_type
    'variable-group'
  end
end