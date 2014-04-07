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

    end
  end
end
