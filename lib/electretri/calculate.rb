module Electretri
  def result(project)
    raise "Expected hash value!" unless project.is_a?(Hash)
    Electretri::Concordance.partial_concordance_matrix(project)
    Electretri::Concordance.global_concordance_matrix(project)
    Electretri::Credibility.create_credibility_matrix(project)
    if project["enable_veto"]
      Electretri::Discordance.partial_discordance_matrix(project)
    end
    Electretri::Cut.cut_level_matrix(project)
    Electretri::Subordination.subordination_matrix(project)
    Electretri::Classification.classification_matrix(project)
    Electretri::Classification.pessimistic(project)
    Electretri::Classification.optimistic(project)
    project
  end

  class Calculate
    include Electretri
    attr_accessor :project

    def initialize(input)
       @project = result(input)
    end
  end

end
