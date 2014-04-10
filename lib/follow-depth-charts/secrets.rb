require 'yaml'
module FollowDepthCharts
  module SecretsLoader
    def load(file)
      YAML.load(file)
    end
  end
end
