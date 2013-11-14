require 'nesstar-api/nesstar-object.rb'
require 'nesstar-api/variable-container.rb'

class VariableGroup < NesstarObject
  include VariableContainer

  attr_reader :id, :label

  def initialize(data)
    @id = data['id']
    @label = data['name']
  end

  @@child_type = 'child-groups'

  private

  def get_variable_group_type
    @@child_type
  end
end