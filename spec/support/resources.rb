module Electretri
  module Test
    module Resources
      def resource(name)
        File.open(File.expand_path(File.join(File.dirname(__FILE__), '..', 'resources', name)))
      end

      def electretri_yml
        resource('electretri.yml')
      end

      def electretri_json
        resource('electretri.json')
      end
    end
  end
end
