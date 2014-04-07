module FollowDepthCharts
  class Runner
    def initialize(token, bot_id, espn_url, teams_file)
      @sender = GroupMeSender.new(token, bot_id)
      @espn_url = espn_url
      @teams_file = teams_file
      run
    end

    def run
      old_teams = load_old_teams
      new_teams = parse_new_teams
      examine_teams(old_teams, new_teams)
      save_new_teams(new_teams)
    end

    private
    def load_old_teams
      TeamSaver.load(@teams_file)
    end

    def parse_new_teams
      Parser.parse_espn(@espn_url)
    end

    def examine_teams(old_teams, new_teams)
      old_teams.each.with_index do |old_team, index|
        new_team = new_teams[index]
        diff = TeamDiff.diff(old_team, new_team)
        if diff != nil && diff != {}
          @sender.report_team_change(new_team.name, diff, 'ESPN')
        end
      end
    end

    def save_new_teams(new_teams)
      TeamSaver.save(new_teams, @teams_file)
    end
  end
end
