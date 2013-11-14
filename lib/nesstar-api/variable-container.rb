module VariableContainer
  def get_variables
    json_variables = get_values "#{self.class.name.downcase}/#{@id}/variables"
    json_variables.collect do | variable_json |
      Variable.new variable_json
    end
  end

  def get_variable_groups
    json_variable_groups = get_values "#{self.class.name.downcase}/#{@id}/#{get_variable_group_type}"
    json_variable_groups.collect do | variable_group_json |
      VariableGroup.new variable_group_json
    end
  end
end