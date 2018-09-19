require "lucid_cop/cop"

module LucidCop
  class OverlyLongScenario < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        next if scenario[:steps].length < 10
        references = [reference(file, feature, scenario)]
        add_error(references, report(scenario[:steps].length))
      end
    end

    def report(value)
      "scenario used #{value} steps; scenarios should have less than 10 steps"
    end
  end
end
