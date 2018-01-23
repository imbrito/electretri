require "spec_helper"

RSpec.describe Electretri do

  let(:by_json) { Electretri.load_json(electretri_json) }

  context "load_json" do
    it "returns hash" do
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
