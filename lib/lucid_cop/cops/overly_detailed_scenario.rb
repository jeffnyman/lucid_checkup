require "lucid_cop/cop"

module LucidCop
  class OverlyDetailedScenario < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        characters = scenario[:steps].map { |step| step[:text].length }.inject(0, :+)
        next if characters < 450
        references = [reference(file, feature, scenario)]
        add_error(references, "Used #{characters} Characters")
      end
    end
  end
end
