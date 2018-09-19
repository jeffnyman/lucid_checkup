require "lucid_cop/cop"

module LucidCop
  class OverlyLongStep < Cop
    def check
      steps do |file, feature, scenario, step|
        next if step[:text].length < 80
        references = [reference(file, feature, scenario, step)]
        add_error(references, report(step[:text].length))
      end
    end

    def report(value)
      "step used #{value} characters; steps should be less than 80 characters"
    end
  end
end
