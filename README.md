[![Build Status](https://travis-ci.org/imbrito/electretri.svg?branch=master)](https://travis-ci.org/imbrito/electretri)

# Electretri

The main objective of this work is to model and develop a micro service implementing the ELECTRE TRI algorithm.

ELECTRE TRI is one of the main multicriteria analysis algorithms, based on the classification concept.

By means of evaluation criteria that allow to define alternatives that will be in comparison, thus allowing to establish preferences among the alternatives under analysis, making it possible to meet the real needs of users who wish to classify alternatives in the multicriteria decision making environment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'electretri'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install electretri

## Usage

+  `include` or `extend` result method.

    The result method receives a hash object and returns a hash with the results.

    Example:
            AwesomeClass
              extend Electretri
            end
            AwesomeClass.result(hash)
            
        or,
            
            AwesomeClass
              include Electretri
            end
            awesome = AwesomeClass.new
            awesome.result(hash)

+ Object

    Uses the result method encapsulated through the class constructor.
        Example:
            Electretri::Calculate.new(hash)


+ API (integrated with your webservices)

    It receives a file of type: YAML, JSON or XML and returns a file of the same received type.
        Example:
            Electretri::API.load_yml(yml_file.yml)
            Electretri::API.load_xml(xml_file.xml)
            Electretri::API.load_json(json_file.json)
            
    For more information go to: `lib/electretri/api.rb`.

    See the file structure in the directory: `spec/resources`.

Any software that is able to run a script or line of ruby ​​code can use gem after its installation.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/imbrito/electretri.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
