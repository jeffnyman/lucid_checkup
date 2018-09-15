require "lucid_cop/cop"

module LucidCop
  class AvoidPunctuation < Cop
    PUNCTUATION = %w[! .].freeze

    def check
      scenarios do |file, feature, scenario|
        next unless scenario.key? :steps

        scenario[:steps].each do |step|
          references = [reference(file, feature, scenario, step)]
          add_error(references) if step[:text].strip.end_with?(*PUNCTUATION)
        end
      end
    end
  end
end
