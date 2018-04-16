require "spec_helper"

RSpec.describe Electretri::API do

  let(:by_yml) { Electretri::API.load_yml(electretri_yml) }

  context "load_yml" do
    it "returns hash" do
      expect(by_yml).to be_an_instance_of(Hash)
      expect(by_yml.keys).to include("name")
      expect(by_yml.keys).to include("description")
      expect(by_yml.keys).to include("enable_veto")
      expect(by_yml.keys).to include("cut")
      expect(by_yml.keys).to include("criteria")
      expect(by_yml.keys).to include("classes")
      expect(by_yml.keys).to include("alternatives")
    end
  end

end