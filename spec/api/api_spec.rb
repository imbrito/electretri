require "spec_helper"

RSpec.describe Electretri::API do

  before(:each) do
    Electretri::API.load_yml(electretri_yml)
    Electretri::API.load_json(electretri_json)
    Electretri::API.load_xml(electretri_xml)
  end

  let(:yaml_file)  { YAML.load_file(result_yml) }
  it "load yaml file" do
    allow(Electretri::API).to receive(:load_yml).with(electretri_yml).and_return(File)
    allow(Electretri::API).to receive(:load_yml).with(electretri_yml).and_yield(yaml_file)
  end

  let(:json_file)  { JSON.parse(File.read(result_json)) }
  it "load json file" do
    allow(Electretri::API).to receive(:load_json).with(electretri_json).and_return(File)
    allow(Electretri::API).to receive(:load_json).with(electretri_json).and_yield(json_file)
  end

  let(:xml_file)  { Hash.from_xml(File.read(result_xml))["hash"] }
  it "load xml file" do
    allow(Electretri::API).to receive(:load_xml).with(electretri_xml).and_return(File)
    allow(Electretri::API).to receive(:load_xml).with(electretri_xml).and_yield(xml_file)
  end
end
