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

	let(:global) {
	{	"a01" => { "aSbh"=>{}, "bhSa"=>{} },
   	"a02" => { "aSbh"=>{}, "bhSa"=>{} },
    "a03" => { "aSbh"=>{}, "bhSa"=>{} } }
  }

  context "matrix hash" do

		it "partial" do
	  	expect(Electretri::Common.partial_matrix_hash(project)).to be_an_instance_of(Hash)
	    expect(Electretri::Common.partial_matrix_hash(project)).to eq(partial)
		end

		it "global" do
	  	expect(Electretri::Common.global_matrix_hash(project)).to be_an_instance_of(Hash)
	    expect(Electretri::Common.global_matrix_hash(project)).to eq(global)
		end

	end

end