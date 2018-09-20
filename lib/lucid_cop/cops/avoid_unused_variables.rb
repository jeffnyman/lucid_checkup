require "lucid_cop/cop"

module LucidCop
  class AvoidUnusedVariables < Cop
    def check
      scenarios do |file, feature, scenario|
        next unless scenario.key?(:examples)

        scenario[:examples].each do |example|
          next unless example.key?(:tableHeader)

          example[:tableHeader][:cells].map { |cell| cell[:value] }.each do |variable|
            references = [reference(file, feature, scenario)]
            unless used?(variable, scenario)
              add_error(references, report(variable))
            end
          end
        end
      end
    end

    def report(value)
      "the variable parameter '<#{value}>' is declared but not referenced"
    end

    def used?(variable, scenario)
      variable = "<#{variable}>"
      return false unless scenario.key? :steps

      scenario[:steps].each do |step|
        return true if step[:text].include? variable
        next unless step.include? :argument
        return true if used_in_docstring?(variable, step)
        return true if used_in_table?(variable, step)
      end

      false
    end

    def used_in_docstring?(variable, step)
      step[:argument][:type] == :DocString &&
        step[:argument][:content].include?(variable)
    end

    def used_in_table?(variable, step)
      return false unless step[:argument][:type] == :DataTable

      step[:argument][:rows].each do |row|
        row[:cells].each { |value| return true if value[:value].include?(variable) }
      end

      false
    end
  end
end
