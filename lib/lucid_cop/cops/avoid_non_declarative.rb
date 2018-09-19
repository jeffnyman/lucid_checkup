require "engtagger"
require "lucid_cop/cop"

module LucidCop
  class AvoidNonDeclarative < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        scenario[:steps].each do |step|
          references = [reference(file, feature, scenario, step)]
          add_warning(references, 'non-declarative sentence') unless verb?(step)
        end
      end
    end

    def verb?(step)
      tagged = tagger.add_tags(step[:text])
      step_verbs = verbs(tagged)
      !step_verbs.empty?
    end

    def verbs(tagged_text)
      verbs =
        %i[
          get_infinitive_verbs
          get_past_tense_verbs
          get_gerund_verbs
          get_passive_verbs
          get_present_verbs
          get_base_present_verbs
        ]

      verbs.map { |verb| tagger.send(verb, tagged_text).keys }.flatten
    end

    def tagger
      @tagger = EngTagger.new unless instance_variable_defined?(:@tagger)
      @tagger
    end
  end
end
