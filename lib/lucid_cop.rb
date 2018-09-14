require "lucid_cop/config"

module LucidCop
  class LucidCop
    # rubocop:disable MutableConstant
    DEFAULT_FILE = File.expand_path('../', __dir__), '**/config', 'default.yml'
    # rubocop:enable MutableConstant
    DEFAULT_CONFIG = Dir.glob(File.join(DEFAULT_FILE)).first.freeze

    def initialize
      @config = Config.new(DEFAULT_CONFIG)
      puts @config.inspect
    end
  end
end
