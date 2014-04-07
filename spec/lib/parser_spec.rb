require 'spec_helper'
include FollowDepthCharts

describe Parser do
  context 'when parsing espn' do
    url = 'http://sports.espn.go.com/fantasy/baseball/flb/story?page=REcloserorgchart'
    teams = Parser.parse_espn(url)

    it 'teams should not be nil' do
      teams.should_not == nil
    end

    it 'returns 30 teams' do
      teams.size.should == 30
    end
  end
end
