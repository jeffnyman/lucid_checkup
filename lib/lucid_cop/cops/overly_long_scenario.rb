require "lucid_cop/cop"

module LucidCop
  class OverlyLongScenario < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        next if scenario[:steps].length < 10
        references = [reference(file, feature, scenario)]
        add_error(references, "Used #{scenario[:steps].length} Steps")
      end
    end
  end
end
