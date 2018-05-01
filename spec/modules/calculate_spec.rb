require "spec_helper"

RSpec.describe Electretri::Calculate do
  let(:result){ YAML.load_file(result_yml) }

  context "raised" do
    it "is not a hash" do
      expect { Object.extend(Electretri).result('project') }.to raise_error(RuntimeError, /Expected hash value!/)
    end
  end

  context "calculate" do

    context "extended" do
      let(:calculate) { Object.extend(Electretri).result(
        YAML.load_file(electretri_yml)
      ) }

      it "is a hash" do
        expect(calculate).to be_an_instance_of(Hash)
        expect(calculate.keys).to include("name")
        expect(calculate.keys).to include("description")
        expect(calculate.keys).to include("enable_veto")
        expect(calculate.keys).to include("cut")
        expect(calculate.keys).to include("criteria")
        expect(calculate.keys).to include("classes")
        expect(calculate.keys).to include("alternatives")
        expect(calculate.keys).to include("partial_concordance")
        expect(calculate.keys).to include("global_concordance")
        expect(calculate.keys).to include("credibility")
        expect(calculate.keys).to include("partial_discordance")
        expect(calculate.keys).to include("cut_level")
        expect(calculate.keys).to include("subordination")
        expect(calculate.keys).to include("classification")
      end
      it "result" do
        expect(calculate).to eq(result)
      end
    end

    context "included" do
      let(:calculate) { Electretri::Calculate.new(
        YAML.load_file(electretri_yml)
      ) }

      it "is a hash" do
        expect(calculate).to be_an_instance_of(Electretri::Calculate)
        expect(calculate.project).to be_an_instance_of(Hash)
        expect(calculate.project.keys).to include("name")
        expect(calculate.project.keys).to include("description")
        expect(calculate.project.keys).to include("enable_veto")
        expect(calculate.project.keys).to include("cut")
        expect(calculate.project.keys).to include("criteria")
        expect(calculate.project.keys).to include("classes")
        expect(calculate.project.keys).to include("alternatives")
        expect(calculate.project.keys).to include("partial_concordance")
        expect(calculate.project.keys).to include("global_concordance")
        expect(calculate.project.keys).to include("credibility")
        expect(calculate.project.keys).to include("partial_discordance")
        expect(calculate.project.keys).to include("cut_level")
        expect(calculate.project.keys).to include("subordination")
        expect(calculate.project.keys).to include("classification")
      end

      it "result" do
        expect(calculate.project).to eq(result)
      end
    end
  end

end
