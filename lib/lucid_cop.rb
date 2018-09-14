require "lucid_cop/config"
require "lucid_cop/cop"
require "lucid_cop/cops/avoid_dumb_stuff"

module LucidCop
  class LucidCop
    # rubocop:disable MutableConstant
    DEFAULT_FILE = File.expand_path('../', __dir__), '**/config', 'default.yml'
    # rubocop:enable MutableConstant
    DEFAULT_CONFIG = Dir.glob(File.join(DEFAULT_FILE)).first.freeze
    COP = Cop.descendants

    def initialize
      @config = Config.new(DEFAULT_CONFIG)
      puts @config.inspect
      puts "Cops: #{COP}"
    end
  end
end
