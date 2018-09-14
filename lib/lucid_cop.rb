require "gherkin/parser"

require "lucid_cop/config"
require "lucid_cop/cop"
require "lucid_cop/cops/avoid_dumb_stuff"

module LucidCop
  class LucidCop
    # rubocop:disable MutableConstant
    DEFAULT_FILE = File.expand_path('../', __dir__), '**/config', 'default.yml'
    # rubocop:enable MutableConstant
    DEFAULT_CONFIG = Dir.glob(File.join(DEFAULT_FILE)).first.freeze
    COP = Cop.descendants

    def initialize(path = nil)
      @files = {}
      @config = Config.new(path || DEFAULT_CONFIG)
      puts "Cops: #{COP}"
    end

    def analyze(file)
      @files[file] = parse(file)
    end

    def parse(file)
      to_json(File.read(file))
    end

    def to_json(input)
      parser = Gherkin::Parser.new
      scanner = Gherkin::TokenScanner.new(input)
      parser.parse(scanner)
    end

    def enabled(name, value)
      @config.config[name]['Enabled'] = value if @config.config.key?(name)
    end

    def disable(disabled_cops)
      disabled_cops.each do |cop|
        enabled cop, false
      end
    end

    def enable(enabled_cops)
      enabled_cops.each do |cop|
        enabled cop, true
      end
    end
  end
end
