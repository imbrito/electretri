require "spec_helper"

RSpec.describe Electretri::Common do
	subject(:project) { Electretri::API.load_yml(electretri_yml) }
	let(:partial) { 
	{ "a01" => {"cr01" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} },
						"cr02" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} },
						"cr03" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} } },
		"a02" => {"cr01" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} },
						"cr02" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} },
						"cr03" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} } },
		"a03" => {"cr01" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} },
						"cr02" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} },
						"cr03" => {"aSbh" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil}, "bhSa" =>{"cl01"=>nil, "cl02"=>nil, "cl03"=>nil} } } }
	}

	it "partial concordance hash" do
  	expect(Electretri::Common.partial_concordance_hash(project)).to be_an_instance_of(Hash)
    expect(Electretri::Common.partial_concordance_hash(project)).to eq(partial)
	end

end