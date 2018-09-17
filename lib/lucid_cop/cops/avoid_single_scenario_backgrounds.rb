require "lucid_cop/cop"

module LucidCop
  class AvoidSingleScenarioBackgrounds < Cop
    def check
      backgrounds do |file, feature, background|
        scenarios = feature[:children].reject do |element|
          element[:type] == :Background
        end
        next if scenarios.length >= 2

        references = [reference(file, feature, background)]
        add_error(references, "There are just #{scenarios.length} scenarios")
      end
    end
  end
end
