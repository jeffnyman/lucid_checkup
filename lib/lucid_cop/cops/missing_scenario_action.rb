require "lucid_cop/cop"

module LucidCop
  class MissingScenarioAction < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        when_steps = scenario[:steps].select do |step|
          step[:keyword] == 'When '
        end
        next unless when_steps.empty?
        references = [reference(file, feature, scenario)]
        add_error(references, 'No \'When\'-Step')
      end
    end
  end
end
