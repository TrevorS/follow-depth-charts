require 'csv'

module FollowDepthCharts
  class TeamSaver

    def self.save(teams)
      CSV.open('teams.txt', 'wb') do |csv|
        teams.each do |team|
          csv << team.to_a
        end
      end
    end

    def self.load(teams)
      teams = []
      CSV.foreach('teams.txt') do |row|
        name = row[0]
        team = Team.new(name)
        team.closer = row[1]
        team.next = row[2]
        team.stealth = row[3]
        team.looming = row[4]
        teams << team
      end
      teams
    end
  end
end
