require 'csv'
module FollowDepthCharts
  module TeamSaver
    def self.save(teams, file)
      CSV.open(file, 'wb') do |csv|
        teams.each do |team|
          csv << team.to_a
        end
      end
    end

    def self.load(file)
      teams = []
      CSV.foreach(file) do |row|
        teams << load_team(row)
      end
      teams
    end

    private
    def self.load_team(row)
      team = Team.new(row[0])
      team.closer = row[1]
      team.next = row[2]
      team.stealth = row[3]
      team.looming = row[4]
      team
    end
  end
end
