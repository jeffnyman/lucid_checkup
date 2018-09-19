require "lucid_cop/cop"

module LucidCop
  class MissingScenarioResult < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        then_steps = scenario[:steps].select do |step|
          step[:keyword] == 'Then '
        end
        next unless then_steps.empty?
        references = [reference(file, feature, scenario)]
        add_error(references, 'the scenario has no \'Then\' step')
      end
    end
  end
end
