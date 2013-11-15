require 'nesstar-api/nesstar-object'
require 'nesstar-api/variable'
require 'nesstar-api/variable-group'
require 'nesstar-api/variable-container'
require 'nesstar-api/tabulation'

class Study < NesstarObject
  attr_reader :id, :name, :abstract

  include VariableContainer

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

  def download
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