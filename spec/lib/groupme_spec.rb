require 'spec_helper'
include FollowDepthCharts

describe GroupMeSender do
  token = 'insert token'
  bot_id = 'insert bot_id'

  context 'when authenticating' do
    sender = GroupMeSender.new(token, bot_id)

    it 'should not return nil' do
      sender.should_not == nil
    end

    it 'should send groupme messages' do
      team_actors = Team.new('Team Actors')
      team_actors.closer = 'Steve Martin'
      team_actors.next = 'Robert Redford'
      team_actors.stealth = 'Chevy Chase'
      team_actors.looming = 'Brad Pitt'

      new_actors = Team.new('Team Actors')
      new_actors.closer = 'Steve Buschemi'
      new_actors.next = 'Robert Palmer'
      new_actors.stealth = 'Chevy Chase'
      new_actors.looming = 'Brad Renfro'

      diff = TeamDiff.diff(team_actors, new_actors)
      sender.report_team_change(team_actors.name, diff, 'ESPN').should_not raise_error
    end
  end
end
