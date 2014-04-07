module FollowDepthCharts
  class Team

    attr_accessor :closer, :next, :stealth, :looming
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def to_a
      [name, closer, self.next, stealth, looming]
    end
  end
end
