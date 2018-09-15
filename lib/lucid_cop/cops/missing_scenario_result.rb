require "lucid_cop/cop"

module LucidCop
  class MissingScenarioResult < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        then_steps = scenario[:steps].select { |step| step[:keyword] == 'Then ' }
        next unless then_steps.empty?
        references = [reference(file, feature, scenario)]
        add_error(references, 'No \'Then\'-Step')
      end
    end
  end
end
