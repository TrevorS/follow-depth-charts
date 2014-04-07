require 'spec_helper'
include FollowDepthCharts

describe Team do
  context 'when initialized' do
    team = Team.new('Atlanta Braves')

    it 'is not nil' do
      team.should_not == nil
    end

    it 'has a name' do
      team.name.should == 'Atlanta Braves'
    end
  end
end
