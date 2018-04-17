require "spec_helper"

RSpec.describe Electretri::Concordance do
	before(:each) do
		Electretri::Concordance.partial_concordance_matrix(project)
		Electretri::Concordance.global_concordance_matrix(project)
		Electretri::Credibility.create_credibility_matrix(project)
	end

	subject!(:project) { Electretri::API.load_yml(electretri_yml) }

	let(:partial_discordance) {
	{ "a01" => {"cr01" => {"aSbh" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>1.0} },
							"cr02" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0} },
							"cr03" => {"aSbh" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>1.0} } },
		"a02" => {"cr01" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0} },
					  	"cr02" => {"aSbh" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>1.0} },
					  	"cr03" => {"aSbh" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>1.0} } },
		"a03" => {"cr01" => {"aSbh" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>0.0} },
							"cr02" => {"aSbh" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>1.0} },
							"cr03" => {"aSbh" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0}, "bhSa" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>1.0} } } }
	}

	context "discordance matrix" do
		it "partial" do
			expect(Electretri::Discordance.partial_discordance_matrix(project)).to be_an_instance_of(Hash)
			expect(project.keys).to include("partial_discordance")
			expect(project["partial_discordance"]).to eq(partial_discordance)
		end
	end

end