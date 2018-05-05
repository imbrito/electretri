require "active_support"
require "active_support/core_ext"
require "builder"
require "yaml"
require "json"

module Electretri
  class << self
    def parse_file(file)
      Electretri::Calculate.new(file)
    end
  end

  module API
    class << self

      def load_yml(path)
        File.open('result.yml', 'w') {|f| f.write Electretri.parse_file(
          YAML.load_file(path)
        ).project.to_yaml }
      end

      def load_json(path)
        File.open('result.json', 'w') {|f| f.write Electretri.parse_file(
          JSON.parse(File.read(path))
        ).project.to_json }
      end

      def load_xml(path)
        File.open('result.xml', 'w') {|f| f.write Electretri.parse_file(
          Hash.from_xml(File.read(path))["hash"]
        ).project.to_xml }
      end
    end
  end
end
