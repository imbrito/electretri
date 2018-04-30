module Electretri
  module Classification
    class << self

      def pessimistic(project)
      	project["alternatives"].each_key do |alternative|
      		for index in 0..project["subordination"][alternative]['aSbh'].size
      			value = project["subordination"][alternative]['aSbh'].keys[index+1]
      			if project["subordination"][alternative]['aSbh'][value] == '>' && project["classification"][alternative]["pessimistic"] == nil
      				project["classification"][alternative]["pessimistic"] = project["subordination"][alternative]['aSbh'].keys[index]
      			end
      		end
      	end
      end

      def optimistic(project)
        project["alternatives"].each_key do |alternative|
      		for index in 0..project["subordination"][alternative]['aSbh'].size
      			value = project["subordination"][alternative]['aSbh'].keys[index]
      			if project["subordination"][alternative]['aSbh'][value] == '<'
      				project["classification"][alternative]['optimistic'] = project["subordination"][alternative]['aSbh'].keys[index]
      			end
      		end
      	end
      end

      def classification_matrix(project)
        project["classification"] = Electretri::Common.classification_matrix_hash(project)
      end

    end
  end

end
