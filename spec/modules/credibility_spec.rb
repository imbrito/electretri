require "spec_helper"

RSpec.describe Electretri::Credibility do
	before(:each) do
		Electretri::Concordance.partial_concordance_matrix(project)
		Electretri::Concordance.global_concordance_matrix(project)
		Electretri::Credibility.create_credibility_matrix(project)
	end
	
	subject!(:project) { Electretri::API.load_yml(electretri_yml) }
	
	let(:credibility) {
		{	"a01" => { "aSbh" =>{"cl01"=>0.4, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.3, "cl03"=>0.0} },
			"a02" => { "aSbh" =>{"cl01"=>0.0, "cl02"=>1.0, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.4, "cl03"=>0.0} },
			"a03" => { "aSbh" =>{"cl01"=>0.0, "cl02"=>0.7, "cl03"=>1.0}, "bhSa" =>{"cl01"=>1.0, "cl02"=>0.6, "cl03"=>0.0} } } 
	}
	
  context "credibility matrix" do

		it "create" do
	  	expect(Electretri::Credibility.create_credibility_matrix(project)).to be_an_instance_of(Hash)
	  	expect(project.keys).to include("credibility")
			expect(project["credibility"]).to eq(credibility)
		end

		it "nullify" do
	  	expect(Electretri::Credibility.nullify_credibility(project,"a01","cl01","aSbh")).to be_an_instance_of(Float)
	  	expect(project["credibility"]["a01"]["aSbh"]["cl01"]).to eq(0.0)  		 
		end		

		it "adjustment" do
	  	expect(Electretri::Credibility.adjustment_credibility(project,"a03","cl02","aSbh",0.8)).to be_an_instance_of(Float)
	  	expect(project["credibility"]["a03"]["aSbh"]["cl02"]).to eq(0.67)  		 
		end
	end

end