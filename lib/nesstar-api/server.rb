require 'nesstar-api/nesstar-object.rb'
require 'nesstar-api/study.rb'

class Server < NesstarObject

  def get_studies
    json_studies = get_values "studies"
    json_studies.collect do | study |
      Study.new study
    end
  end

end