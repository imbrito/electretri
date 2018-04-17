module Electretri
  module Cut
    class << self

      def cut_level_matrix(project)
        project["cut_level"] = Electretri::Common.global_matrix_hash(project)        
        project["classes"].each_key do |klass|
          project["credibility"].each_key do |key| 
            if project["credibility"][key]['aSbh'][klass] >= project["cut"]
              project["cut_level"][key]['aSbh'][klass] = 1
            else
              project["cut_level"][key]['aSbh'][klass] = 0
            end
            if project["credibility"][key]['bhSa'][klass] >= project["cut"]
              project["cut_level"][key]['bhSa'][klass] = 1
            else
              project["cut_level"][key]['bhSa'][klass] = 0
            end
          end
        end
      end

    end
  end
end
