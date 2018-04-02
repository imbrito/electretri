require "active_support"
require "active_support/core_ext"
require "builder"
require "yaml"
require "json"

module Electretri
  module API
    class << self
      def load_yml(path)
        YAML.load_file(path)
      end

      def load_json(path)
        JSON.parse(File.read(path))
      end

      def load_xml(path)
        Hash.from_xml(File.read(path))["hash"]
      end
    end
  end
end
