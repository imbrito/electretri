require "electretri/version"
require "yaml"

module Electretri
  def self.load_yml(path)
    YAML.load_file(path)
  end
end
