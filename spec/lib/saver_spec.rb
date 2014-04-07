require 'spec_helper'
require 'fileutils'
include FollowDepthCharts

describe TeamSaver do
  test_filename = 'test-teams.txt'

  team = Team.new('Team Actors')
  team.closer = 'Steve Martin'
  team.next = 'Robert Redford'
  team.stealth = 'Chevy Chase'
  team.looming = 'Brad Pitt'
  teams = [team]

  context 'when saving teams' do
    it 'should save them with out error' do
      TeamSaver.save(teams, test_filename).should_not raise_error
    end
  end

  context 'when loading teams' do
    it 'should load them with out error' do
      TeamSaver.load(test_filename).should_not raise_error
    end
    it 'should return an array of teams' do
      loaded_teams = TeamSaver.load(test_filename)
      loaded_teams.size.should == 1
    end
    it 'should be not be different before and after saving' do
      loaded_teams = TeamSaver.load(test_filename)
      loaded_team = loaded_teams[0]
      team = teams[0]
      TeamDiff.diff(loaded_team, team).should == {}
    end
  end
  FileUtils.rm(test_filename)
end
