require "lucid_cop/cop"

module LucidCop
  class MissingScenarioName < Cop
    def check
      scenarios do |file, feature, scenario|
        name = scenario.key?(:name) ? scenario[:name].strip : ''
        references = [reference(file, feature, scenario)]
        next unless name.empty?
        add_error(references, 'No Scenario Name')
      end
    end
  end
end
