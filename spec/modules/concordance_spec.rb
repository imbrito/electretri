require "spec_helper"

RSpec.describe Electretri::Concordance do
	subject(:project) { Electretri::API.load_yml(electretri_yml) }
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

	it "partial concordance matrix" do
		expect(Electretri::Concordance.partial_concordance_matrix(project)).to be_an_instance_of(Hash)
		expect(project.keys).to include("partial_concordance")
		expect(project["partial_concordance"]).to eq(partial_concordance)
	end

end