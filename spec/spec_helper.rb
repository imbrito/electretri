require "bundler/setup"
require "electretri"
require "yaml"

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'electretri'))
Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include Electretri::Test::Resources

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
