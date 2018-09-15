require "gherkin/parser"

require "lucid_cop/config"
require "lucid_cop/cop"
require "lucid_cop/cops/avoid_punctuation"
require "lucid_cop/cops/invalid_file_name"
require "lucid_cop/cops/missing_feature_name"
require "lucid_cop/cops/missing_scenario_name"
require "lucid_cop/cops/missing_feature_description"
require "lucid_cop/cops/missing_scenario_action"
require "lucid_cop/cops/missing_scenario_result"

module LucidCop
  class LucidCop
    # rubocop:disable MutableConstant
    DEFAULT_FILE = File.expand_path('../', __dir__), '**/config', 'default.yml'
    # rubocop:enable MutableConstant
    DEFAULT_CONFIG = Dir.glob(File.join(DEFAULT_FILE)).first.freeze
    COP = Cop.descendants

    def initialize(path = nil)
      @files = {}
      @cop = []
      @config = Config.new(path || DEFAULT_CONFIG)
      @verbose = false
    end

    def setup_cops
      @cop = []
      COP.each do |cop|
        new_cop = cop.new
        new_cop_class = new_cop.class.name.split('::').last
        cop_enabled = @config.config[new_cop_class]['Enabled']
        confirm_enabled(new_cop) if cop_enabled
        @cop.push new_cop if cop_enabled
      end
    end

    def set_verbose(value)
      @verbose = true if value
    end

    def report
      issues = @cop.map do |cop|
        cop.check_files(@files)
        cop.issues
      end.flatten

      display(issues)

      return 0 if issues.select { |issue| issue.class == Error }.empty?
      -1
    end

    def confirm_enabled(cop)
      @config.config[cop.class.name.split('::').last].each do |setting, _|
        next if setting.downcase.casecmp('enabled').zero?
      end
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

    def display(issues)
      puts "No issues found." if issues.empty? && @verbose
      issues.each { |issue| puts issue.render }
    end
  end
end
