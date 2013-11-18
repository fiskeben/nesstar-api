module VariableContainer

  ##
  # Gets a list of variables.
  def get_variables
    json_variables = get_values "#{get_rest_type}/#{@id}/variables"
    json_variables.collect do | variable_json |
      Variable.new variable_json
    end
  end

  ##
  # Gets a list of variable groups.
  def get_variable_groups
    json_variable_groups = get_values "#{get_rest_type}/#{@id}/#{get_variable_group_type}"
    json_variable_groups.collect do | variable_group_json |
      VariableGroup.new variable_group_json
    end
  end
end