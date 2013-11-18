##
# Represents a tabulation run on a +Study+.
class Tabulation
  attr_reader :data, :variables, :measure, :measure_types, :case_subset

  def initialize(data, input)
    @data = data['data']
    @variables = input['breakVars']
    @measure = input['msrVar']
    @measure_types = input['msrType']
    @case_subset = input['casesubset']
  end

end