module Electretri
  module Discordance
    class << self

      def partial_discordance_matrix(project)
      	project["partial_discordance"] = Electretri::Common.partial_matrix_hash(project)
        project["criteria"].each_key do |criterion|
      		if project["criteria"][criterion]["direction"].eql?('increasing')
      			self.increasing_partial_discordance(project,criterion,project["partial_discordance"])
      		else
      			#TO DO: self.decreasing_partial_discordance(project,criterion,project["partial_disconcordance"])
      		end
      	end
      end

      def increasing_partial_discordance(project,criterion,matrix)
      	project["alternatives"].each_key do |alternative|
      		project["classes"].each_key do |klass|

            case 
            # subordination: a S bh
            when (project["alternatives"][alternative][criterion] > (project["classes"][klass][criterion] - 
                  project["criteria"][criterion]["preference"]))
              
              matrix[alternative][criterion]['aSbh'][klass] = 0.0

            when (project["alternatives"][alternative][criterion] <= (project["classes"][klass][criterion] - 
              project["criteria"][criterion]["veto"]))
                          
              matrix[alternative][criterion]['aSbh'][klass] = 1.0
              Electretri::Credibility.nullify_credibility(project,alternative,klass,'aSbh')

            else 
              
              numerador = project["classes"][klass][criterion] - project["alternatives"][alternative][criterion] - project["criteria"][criterion]["preference"]
              denominador = project["criteria"][criterion]["veto"] - project["criteria"][criterion]["preference"]

              matrix[alternative][criterion]['aSbh'][klass] = numerador.to_f / denominador.to_f
              discordance = matrix[alternative][criterion]['aSbh'][klass]
              Electretri::Credibility.adjustment_credibility(project,alternative,klass,'aSbh',discordance)

            end
            
            case
            # subordination: bh S a
            when ( project["classes"][klass][criterion] > (project["alternatives"][alternative][criterion] - 
                  project["criteria"][criterion]["preference"]))
              
              matrix[alternative][criterion]['bhSa'][klass] = 0.0

            when (project["classes"][klass][criterion] <= (project["alternatives"][alternative][criterion] - project["criteria"][criterion]["veto"]))
                          
              matrix[alternative][criterion]['bhSa'][klass] = 1.0
              Electretri::Credibility.nullify_credibility(project,alternative,klass,'bhSa')

            else 
              
              numerador = project["alternatives"][alternative][criterion] - project["classes"][klass][criterion] - project["criteria"][criterion]["preference"]
              denominador = project["criteria"][criterion]["veto"] - project["criteria"][criterion]["preference"]

              matrix[alternative][criterion]['bhSa'][klass] = numerador.to_f / denominador.to_f
              discordance = matrix[alternative][criterion]['bhSa'][klass]

              Electretri::Credibility.adjustment_credibility(project,alternative,klass,'bhSa',discordance)

            end    		
            
      		end
      	end
      end

    end
  end
end
