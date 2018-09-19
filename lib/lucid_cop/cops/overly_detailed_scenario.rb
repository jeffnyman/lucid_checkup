require "lucid_cop/cop"

module LucidCop
  class OverlyDetailedScenario < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        characters = scenario[:steps].map { |step| step[:text].length }.inject(0, :+)
        next if characters < 450
        references = [reference(file, feature, scenario)]
        add_error(references, report(characters))
      end
    end

    def report(value)
      "scenario used #{value} characters; the scenario as a whole should be less than 450 characters"
    end
  end
end
