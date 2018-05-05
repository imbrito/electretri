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

      def electretri_xml
        resource('electretri.xml')
      end

      def result_yml
        resource('result.yml')
      end

      def result_json
        resource('result.json')
      end

      def result_xml
        resource('result.xml')
      end
    end
  end
end
