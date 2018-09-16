require "lucid_cop/cop"

module LucidCop
  class AvoidNonContextBackgrounds < Cop
    def check
      backgrounds do |file, feature, background|
        next unless background.key? :steps
        invalid_steps = background[:steps].select { |step| step[:keyword] == 'When ' || step[:keyword] == 'Then ' }
        next if invalid_steps.empty?
        references = [reference(file, feature, background, invalid_steps[0])]
        add_error(references, 'Just Given Steps allowed')
      end
    end
  end
end
