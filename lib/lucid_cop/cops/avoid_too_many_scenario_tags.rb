require "lucid_cop/cop"
require "lucid_cop/cops/mixins/tag_collection"

module LucidCop
  class AvoidTooManyScenarioTags < Cop
    include TagCollection

    def check
      scenarios do |file, feature, scenario|
        tags = collect_tags(scenario)
        next unless tags.length > 3
        references = [reference(file, feature, scenario)]
        add_warning(references, report(tags.length))
      end
    end

    def report(value)
      "scenario uses #{value} tags; scenarios should use 3 or fewer tags"
    end
  end
end
