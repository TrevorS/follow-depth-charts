module FollowDepthCharts
  class Team

    attr_accessor :closer, :next, :stealth, :looming
    attr_reader :name

    def initialize(name)
      @name = name
    end

  end
end
