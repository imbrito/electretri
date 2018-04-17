module Electretri
  module Subordination
    class << self

      def subordination_matrix(project)
        project["subordination"] = Electretri::Common.subordination_matrix_hash(project)
        project["alternatives"].each_key do |alternative|
          project["classes"].each_key do |klass|  
            if (project["cut_level"][alternative]['aSbh'][klass] == 0) && (project["cut_level"][alternative]['bhSa'][klass] == 1)
              project["subordination"][alternative]['aSbh'][klass] = '<'

            elsif (project["cut_level"][alternative]['aSbh'][klass] == 1) && (project["cut_level"][alternative]['bhSa'][klass] == 0)
              project["subordination"][alternative]['aSbh'][klass] = '>'

            elsif (project["cut_level"][alternative]['aSbh'][klass] == 1) && (project["cut_level"][alternative]['bhSa'][klass] == 1)
              project["subordination"][alternative]['aSbh'][klass] = 'I'

            elsif (project["cut_level"][alternative]['aSbh'][klass] == 0) && (project["cut_level"][alternative]['bhSa'][klass] == 0)
              project["subordination"][alternative]['aSbh'][klass] = 'R'
            end
          end
        end
      end

    end
  end
end
