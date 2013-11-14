require 'nesstar-api/nesstar-object.rb'
require 'nesstar-api/variable-container.rb'

class VariableGroup < NesstarObject
  include VariableContainer

  @@child_type = 'child-groups'

  private

  def get_child_type
    @@child_type
  end
end