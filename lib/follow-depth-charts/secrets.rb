require 'yaml'
module FollowDepthCharts
  module SecretsLoader
    def self.load(file)
      YAML.load_file(file)
    end
  end
end
