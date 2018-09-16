require "lucid_cop/cop"
require "lucid_cop/cops/mixins/tag_collection"

module LucidCop
  class TooManyTags < Cop
    include TagCollection

    def check
      scenarios do |file, feature, scenario|
        tags = collect_tags(feature) + collect_tags(scenario)
        next unless tags.length >= 3
        references = [reference(file, feature, scenario)]
        add_warning(references, "Used #{tags.length} Tags")
      end
    end
  end
end
