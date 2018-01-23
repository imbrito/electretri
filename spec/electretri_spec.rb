require "spec_helper"

RSpec.describe Electretri do
  it "has a version number" do
    expect(Electretri::VERSION).not_to be nil
  end

  let(:by_yml) { Electretri.load_yml(electretri_yml) }
  context "load_yml" do
    it "returns hash file" do
      expect(by_yml).to be_an_instance_of(Hash)
      expect(by_yml.keys).to include("name")
      expect(by_yml.keys).to include("description")
      expect(by_yml.keys).to include("enable_veto")
      expect(by_yml.keys).to include("cut")
      expect(by_yml.keys).to include("criteria")
      expect(by_yml.keys).to include("profiles")
      expect(by_yml.keys).to include("alternatives")
    end
  end

  let(:by_json) { Electretri.load_yml(electretri_json) }
  context "load_json" do
    it "returns hash file" do
      expect(by_json).to be_an_instance_of(Hash)
      expect(by_json.keys).to include("name")
      expect(by_json.keys).to include("description")
      expect(by_json.keys).to include("enable_veto")
      expect(by_json.keys).to include("cut")
      expect(by_json.keys).to include("criteria")
      expect(by_json.keys).to include("profiles")
      expect(by_json.keys).to include("alternatives")
    end
  end
end
