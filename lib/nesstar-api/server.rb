require 'nesstar-api/nesstar-object.rb'
require 'nesstar-api/study.rb'

class Server < NesstarObject

  def get_studies
    json_studies = get_values "studies"
    json_studies.collect do | study |
      Study.new study
    end
  end

  def get_study(id)
    json = get_values "study/#{id}"
    if json
      study_id = dig(json, :ID)
      name = dig(json, :stdyDscr, :citation, :titlStmt, :titl)
      abstract = dig(json, :stdyDscr, :stdyInfo, :abstract)

      Study.new({'id' => study_id, 'name' => name, 'abstract' => abstract})
    end
  end

end