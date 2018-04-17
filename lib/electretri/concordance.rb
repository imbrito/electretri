module Electretri
  module Concordance
    class << self

      def global_concordance_matrix(project)
        project["global_concordance"] = Electretri::Common.global_matrix_hash(project)
        project["classes"].each_key do |klass|
          project["partial_concordance"].keys.each do |key| 
            aSbh, bhSa = 0, 0
            project["partial_concordance"][key].each_key do |value| 
              aSbh += (project["partial_concordance"][key][value]['aSbh'][klass] * project["criteria"][value]["weight"])
              bhSa += (project["partial_concordance"][key][value]['bhSa'][klass] * project["criteria"][value]["weight"])
            end
            project["global_concordance"][key]['aSbh'][klass] = aSbh.round(2)
            project["global_concordance"][key]['bhSa'][klass] = bhSa.round(2)
          end
        end
      end

      def partial_concordance_matrix(project)
      	project["partial_concordance"] = Electretri::Common.partial_matrix_hash(project)
        project["criteria"].each_key do |criterion|
      		if project["criteria"][criterion]["direction"].eql?('increasing')
      			self.increasing_partial_concordance(project,criterion,project["partial_concordance"])
      		else
      			#TO DO: self.decreasing_partial_concordance(project,criterion,project["partial_concordance"])
      		end
      	end
      end

      def increasing_partial_concordance(project,criterion,matrix)
      	project["alternatives"].each_key do |alternative|
      		project["classes"].each_key do |klass|    		
            
            case
        		#subordination: aSbh
            when ( project["alternatives"][alternative][criterion] <= (project["classes"][klass][criterion] -
      						project["criteria"][criterion]["preference"]) )

      				matrix[alternative][criterion]['aSbh'][klass] = 0.0

      			when ( (project["classes"][klass][criterion] - project["criteria"][criterion]["indifference"]) <
      						project["alternatives"][alternative][criterion] )

      				matrix[alternative][criterion]['aSbh'][klass] = 1.0

      			when ( (project["classes"][klass][criterion] - project["criteria"][criterion]["preference"]) <
      						project["alternatives"][alternative][criterion]) && (project["alternatives"][alternative][criterion] <=
      						(project["classes"][klass][criterion] - project["criteria"][criterion]["indifference"]) )

      				numerator = project["alternatives"][alternative][criterion] - project["classes"][klass][criterion] + project["criteria"][criterion]["preference"]
      				denominator = project["criteria"][criterion]["preference"] - project["criteria"][criterion]["indifference"]
      				matrix[alternative][criterion]['aSbh'][klass] = numerador.to_f / denominador.to_f
      			end

      			case
      			#subordination: bhSa
      			when ( project["classes"][klass][criterion] <= (project["alternatives"][alternative][criterion] - 
              project["criteria"][criterion]["preference"]) )

      				matrix[alternative][criterion]['bhSa'][klass] = 0.0

      			when ( (project["alternatives"][alternative][criterion] - project["criteria"][criterion]["indifference"]) < 
              project["classes"][klass][criterion] )

      				matrix[alternative][criterion]['bhSa'][klass] = 1.0

      			when ( (project["alternatives"][alternative][criterion] - project["criteria"][criterion]["preference"]) < 
              project["classes"][klass][criterion]) && (project["classes"][klass][criterion] <= 
              (project["alternatives"][alternative][criterion] - project["criteria"][criterion]["indifference"]) )

      				numerator = project["classes"][klass][criterion] - project["alternatives"][alternative][criterion] + project["criteria"][criterion]["preference"]
      				denominator = project["criteria"][criterion]["preference"] - project["criteria"][criterion]["indifference"]
      				matrix[alternative][criterion]['bhSa'][klass] = numerador.to_f / denominador.to_f
      			end

      		end
      	end
      end

    end
  end
end
