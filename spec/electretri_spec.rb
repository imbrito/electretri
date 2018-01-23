require "spec_helper"

RSpec.describe Electretri do
  it "has a version number" do
    expect(Electretri::VERSION).not_to be nil
  end

  let(:electretri) { Electretri.load_yml(electretri_yml) }

  context "load_yml" do
    it "returns hash file" do
      expect(electretri).to be_an_instance_of(Hash)
      expect(electretri.keys).to include(:name)
      expect(electretri.keys).to include(:description)
      expect(electretri.keys).to include(:enable_veto)
      expect(electretri.keys).to include(:cut)
      expect(electretri.keys).to include(:criteria)
      expect(electretri.keys).to include(:profiles)
      expect(electretri.keys).to include(:alternatives)
    end
  end
end
