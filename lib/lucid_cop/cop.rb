require "lucid_cop/issue"

module LucidCop
  class Cop
    attr_reader :issues

    def self.descendants
      ObjectSpace.each_object(::Class).select { |klass| klass < self }
    end

    def initialize
      @files = {}
      @issues = []
    end

    def check
      raise 'check has not been implemented on a cop class'
    end

    def check_files(files)
      @files = files
      check
    end

    def reference(file, feature = nil, scenario = nil, step = nil)
      return file if feature.nil? || feature[:name].empty?
      result = "#{file} (#{line(feature, scenario, step)}): #{feature[:name]}"
      result += ".#{scenario[:name]}" unless scenario.nil? || scenario[:name].empty?
      result += " step: #{step[:text]}" unless step.nil?
      result
    end

    def elements
      @files.each do |file, content|
        feature = content[:feature]
        next if feature.nil?
        next unless feature.key? :children
        feature[:children].each do |scenario|
          yield(file, feature, scenario)
        end
      end
    end

    def line(feature, scenario, step)
      line = feature.nil? ? nil : feature[:location][:line]
      line = scenario[:location][:line] unless scenario.nil?
      line = step[:location][:line] unless step.nil?
      line
    end

    def name
      self.class.name.split('::').last
    end

    def scenarios
      elements do |file, feature, scenario|
        yield(file, feature, scenario)
      end
    end

    def add_error(references, description = nil)
      @issues.push Error.new(name, references, description)
    end
  end
end
