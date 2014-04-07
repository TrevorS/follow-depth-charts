require 'spec_helper'
include FollowDepthCharts

describe TeamDiff do

  context 'when teams name do not match' do
    team_old = Team.new('Atlanta Braves')
    team_new = Team.new('Chicago Cubs')
    it 'should return nil' do
      TeamDiff.diff(team_old, team_new).should == nil
    end
  end

  context 'when team names do match' do
    team_actors = Team.new('Team Actors')
    team_actors.closer = 'Steve Martin'
    team_actors.next = 'Robert Redford'
    team_actors.stealth = 'Chevy Chase'
    team_actors.looming = 'Brad Pitt'

    it 'should not return nil' do
      TeamDiff.diff(team_actors, team_actors).should_not == nil
    end

    it 'should return an empty hash if nothing has changed' do
      TeamDiff.diff(team_actors, team_actors).should == {}
    end

    changed_team = Team.new('Team Actors')
    changed_team.closer = 'Omar Epps'
    changed_team.next = 'Robert Redford'
    changed_team.stealth = 'Chevy Chase'
    changed_team.looming = 'Brad Pitt'

    changed_diff = TeamDiff.diff(team_actors, changed_team)

    it 'should return a hash where the size is equal to the # of changes' do
      changed_diff.size.should == 1
    end

    it 'should return a hash containing the changes' do
      closer_changes = changed_diff[:closer]
      closer_changes[:old].should == 'Steve Martin'
      closer_changes[:new].should == 'Omar Epps'
    end
  end
end
