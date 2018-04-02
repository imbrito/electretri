require "spec_helper"

RSpec.describe Electretri::API do

  let(:by_xml) { Electretri::API.load_xml(electretri_xml) }

  context "load_xml" do
    it "returns hash" do
      expect(by_xml).to be_an_instance_of(Hash)
      expect(by_xml.keys).to include("name")
      expect(by_xml.keys).to include("description")
      expect(by_xml.keys).to include("enable_veto")
      expect(by_xml.keys).to include("cut")
      expect(by_xml.keys).to include("criteria")
      expect(by_xml.keys).to include("profiles")
      expect(by_xml.keys).to include("alternatives")
    end
  end

end
