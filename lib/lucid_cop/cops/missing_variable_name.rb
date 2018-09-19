require "lucid_cop/cop"

module LucidCop
  class MissingVariableName < Cop
    def check
      filled_scenarios do |file, feature, scenario|
        known_vars = Set.new(known_variables(scenario))

        scenario[:steps].each do |step|
          step_vars(step).each do |used_var|
            next if known_vars.include?(used_var)
            references = [reference(file, feature, scenario)]
            add_error(references, report(used_var))
          end
        end
      end
    end

    def report(value)
      "the variable parameter '<#{value}>' is referenced but is not declared"
    end

    def step_vars(step)
      vars = collect_vars(step[:text])
      return vars unless step.include?(:argument)
      vars + collect_vars_from_argument(step[:argument])
    end

    def collect_vars_from_argument(argument)
      return collect_vars(argument[:content]) if argument[:type] == :DocString

      (argument[:rows] || []).map do |row|
        row[:cells].map { |value| collect_vars(value[:value]) }.flatten
      end.flatten
    end

    def collect_vars(string)
      string.scan(/<.+?>/).map { |val| val[1..-2] }
    end

    def known_variables(scenario)
      (scenario[:examples] || []).map do |example|
        next unless example.key? :tableHeader
        example[:tableHeader][:cells].map { |cell| cell[:value].strip }
      end.flatten
    end
  end
end
