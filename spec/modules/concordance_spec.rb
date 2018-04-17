require "spec_helper"

RSpec.describe Electretri::Concordance do
	before { Electretri::Concordance.partial_concordance_matrix(project) }
	subject!(:project) { YAML.load_file(electretri_yml) }

	let(:partial_concordance) {
	{ "a01" => {"cr01" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0} },
							"cr02" => {"aSbh" =>{"cl01"=>1.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0} },
							"cr03" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>1.0, "cl03"=>0.0} } },
		"a02" => {"cr01" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0} },
							"cr02" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>1.0, "cl03"=>0.0} },
							"cr03" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0} } },
		"a03" => {"cr01" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>0.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>1.0, "cl03"=>0.0} },
							"cr02" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.0, "cl03"=>0.0} },
							"cr03" => {"aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>1.0, "cl03"=>0.0} } } }
	}

	let(:global_concordance) {
	{ "a01" => { "aSbh" =>{"cl01"=>0.4, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.3, "cl03"=>0.0} },
		"a02" => { "aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.4, "cl03"=>0.0} },
		"a03" => { "aSbh" =>{"cl01"=>0.0, "cl02"=>0.7, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.6, "cl03"=>0.0} } }
	}

	context "concordance matrix" do
		it "partial" do
			expect(Electretri::Concordance.partial_concordance_matrix(project)).to be_an_instance_of(Hash)
			expect(project.keys).to include("partial_concordance")
			expect(project["partial_concordance"]).to eq(partial_concordance)
		end
	
		it "global" do
			expect(Electretri::Concordance.global_concordance_matrix(project)).to be_an_instance_of(Hash)
			expect(project.keys).to include("global_concordance")
			expect(project["global_concordance"]).to eq(global_concordance)
		end
	end

end