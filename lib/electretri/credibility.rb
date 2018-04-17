module Electretri
  module Credibility
    class << self

      def create_credibility_matrix(project)
      	project["credibility"] = Marshal.load(Marshal.dump(project["global_concordance"]))
      end

      def nullify_credibility(project,alternative,klass,relation)
        project["credibility"][alternative][relation][klass] = 0.0
      end

      def adjustment_credibility(project,alternative,klass,relation,discordance)      
        if (project["global_concordance"][alternative][relation][klass] < discordance && discordance < 1)
          
          adjustment = (1 - discordance) / (1 - project["global_concordance"][alternative][relation][klass])
          project["credibility"][alternative][relation][klass] = adjustment.round(2)

        end
      end

    end
  end
end
