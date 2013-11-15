require 'tempfile'
require 'nesstar-api/nesstar-object'
require 'nesstar-api/variable'
require 'nesstar-api/variable-group'
require 'nesstar-api/variable-container'
require 'nesstar-api/tabulation'

class Study < NesstarObject
  attr_reader :id, :name, :abstract

  include VariableContainer

  NSDSTAT = "NSDSTAT"
  SAS = "SAS"
  SPSS = "SPSS"
  SPSSPORT = "SPSSPORT"
  STATA = "STATA"
  STATA6 = "STATA6"
  STATA7 = "STATA7"

  def initialize(data)
    @id = data['id']
    @name = data['name']
    @abstract = data['abstract']
    @last_update = data['updatedTimeStamp']
  end

  def tabulate(options)
    path = "study/#{@id}/tabulate/"
    query_string = prepare_query_string_for_tabulation options

    if query_string.length > 0
      path += "?" + query_string.join('&')
    end

    tabulation = get_values path
    Tabulation.new tabulation, options
  end

  def correlate
  end

  def regress
  end

  def download(format, variables = [], case_subset = nil)
    path = "study/#{@id}/download"

    query_string = ["format=" + format]
    query_string += collect_list(variables, "var", :id)
    query_string.push("caseSubset=" + case_subset) unless case_subset.nil?

    path += "?" + query_string.join('&')

    get_binary(path) do | data |
      if block_given?
        yield(data)
      else
        file = Tempfile.new("#{@name}.#{format}")
        file.write(data)
        file.close
        return file
      end
    end
  end

  private

  def get_variable_group_type
    'variable-groups'
  end

  def get_rest_type
    'study'
  end

  def prepare_query_string_for_tabulation(options)
    query_string = []

    query_string += collect_list(options['breakVars'], 'breakVar', :id)
    query_string += collect_list(options['msrType'], 'msrType')
    query_string.push "msrVar=#{options['msrVar'].id}" unless options['mrsVar'].nil?
    query_string.push(options['casesubset']) unless options['casesubset'].nil?

    query_string
  end

  def collect_list(list, name, attribute = nil)
    if list.nil?
      []
    else
      list.collect { | obj |
        value = attribute.nil? ? obj : obj.send(attribute)
        "#{name}=#{value}"
      }
    end
  end
end