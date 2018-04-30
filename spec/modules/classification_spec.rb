require "spec_helper"

RSpec.describe Electretri::Classification do
	before(:each) do
		Electretri::Concordance.partial_concordance_matrix(project)
		Electretri::Concordance.global_concordance_matrix(project)
		Electretri::Credibility.create_credibility_matrix(project)
		Electretri::Discordance.partial_discordance_matrix(project)
		Electretri::Cut.cut_level_matrix(project)
    Electretri::Subordination.subordination_matrix(project)
	end

	subject!(:project) { YAML.load_file(electretri_yml) }

  let!(:classification) {
  {	"a01" => { "pessimistic"=>nil, "optimistic"=>nil },
    "a02" => { "pessimistic"=>nil, "optimistic"=>nil },
    "a03" => { "pessimistic"=>nil, "optimistic"=>nil } }
  }

  context "before set classification matrix" do

    it "classification matrix" do
      expect(Electretri::Classification.classification_matrix(project)).to be_an_instance_of(Hash)
	  	expect(project.keys).to include("classification")
      expect(project["classification"].keys).to eq(["a01","a02","a03"])
      expect(project["classification"]["a01"].keys).to eq(["pessimistic","optimistic"])
      expect(project["classification"]["a02"].keys).to eq(["pessimistic","optimistic"])
      expect(project["classification"]["a03"].keys).to eq(["pessimistic","optimistic"])
			expect(project["classification"]).to eq(classification)
    end

  end

  context "after set classification matrix" do
    before(:each) do
      Electretri::Classification.classification_matrix(project)
      Electretri::Classification.pessimistic(project)
      Electretri::Classification.optimistic(project)
    end


    it "pessimistic" do
			expect(project["classification"]["a01"]["pessimistic"]).to eq("cl01")
      expect(project["classification"]["a02"]["pessimistic"]).to eq("cl01")
      expect(project["classification"]["a03"]["pessimistic"]).to eq("cl02")
		end

    it "optimistic" do
      expect(project["classification"]["a01"]["optimistic"]).to eq("cl01")
      expect(project["classification"]["a02"]["optimistic"]).to eq("cl01")
      expect(project["classification"]["a03"]["optimistic"]).to eq("cl01")
		end

	end

end
