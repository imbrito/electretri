require "spec_helper"

RSpec.describe Electretri::Subordination do
	before(:each) do
		Electretri::Concordance.partial_concordance_matrix(project)
		Electretri::Concordance.global_concordance_matrix(project)
		Electretri::Credibility.create_credibility_matrix(project)
		Electretri::Discordance.partial_discordance_matrix(project)
		Electretri::Cut.cut_level_matrix(project)
	end
	
	subject!(:project) { YAML.load_file(electretri_yml) }

	let(:subordination){
	{	"a01" => { "aSbh" => {"cl01"=>"<", "cl02"=>">", "cl03"=>">"} },
		"a02" => { "aSbh" => {"cl01"=>"<", "cl02"=>">", "cl03"=>">"} },
		"a03" => { "aSbh" => {"cl01"=>"<", "cl02"=>"R", "cl03"=>">"} } }
	}
			
  context "subordination" do

		it "matrix" do
	  	expect(Electretri::Subordination.subordination_matrix(project)).to be_an_instance_of(Hash)
	  	expect(project.keys).to include("subordination")
			expect(project["subordination"]).to eq(subordination)
		end

	end

end