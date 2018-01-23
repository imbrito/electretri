require "electretri/version"
require "yaml"
require "json"

module Electretri
  def self.load_yml(path)
    YAML.load_file(path)
  end

  def self.load_json(path)
    JSON.parse(File.read('electretri.json'))
  end
end
