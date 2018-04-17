require "spec_helper"

RSpec.describe Electretri::Cut do
	before(:each) do
		Electretri::Concordance.partial_concordance_matrix(project)
		Electretri::Concordance.global_concordance_matrix(project)
		Electretri::Credibility.create_credibility_matrix(project)
		Electretri::Discordance.partial_discordance_matrix(project)
	end
	
	subject!(:project) { YAML.load_file(electretri_yml) }

	let(:cut){
	{ "a01" => { "aSbh" => {"cl01"=>0, "cl02"=>1, "cl03"=>1}, "bhSa" => {"cl01"=>1, "cl02"=>0, "cl03"=>0} },
		"a02" => { "aSbh" => {"cl01"=>0, "cl02"=>1, "cl03"=>1}, "bhSa" => {"cl01"=>1, "cl02"=>0, "cl03"=>0} },
		"a03" => { "aSbh" => {"cl01"=>0, "cl02"=>0, "cl03"=>1}, "bhSa" => {"cl01"=>1, "cl02"=>0, "cl03"=>0} } }
	}
			
  context "cut level" do

		it "matrix" do
	  	expect(Electretri::Cut.cut_level_matrix(project)).to be_an_instance_of(Hash)
	  	expect(project.keys).to include("cut_level")
			expect(project["cut_level"]).to eq(cut)
		end

	end

end