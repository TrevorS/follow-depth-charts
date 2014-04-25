require 'groupme'
module FollowDepthCharts
  class GroupMeSender
    def initialize(token, bot_id)
      @client = GroupMe::Client.new(token: token)
      @bot_id = bot_id
    end

    def report_team_change(team_name, diff, depth_chart_name)
      message = format_message(team_name, diff, depth_chart_name)
      @client.bot_post_message(@bot_id, message)
    end

    private
    def format_message(team_name, diff, depth_chart_name)
      message =  "FolowDepthCharts version: #{VERSION}\n"
      message += "Timestamp: #{Time.now.strftime('%m-%d-%Y %H:%M')}\n"
      message += "DepthChart change from: #{depth_chart_name}.\n"
      message += "Team: #{team_name}\n"
      if diff[:closer]
        message += make_change('Closer', diff[:closer])
      end
      if diff[:next]
        message += make_change('Next', diff[:next])
      end
      if diff[:stealth]
        message += make_change('Stealth', diff[:stealth])
      end
      if diff[:looming]
        message += make_change('Looming', diff[:looming])
      end
      message
    end

    def make_change(position_name, position_diff)
      "#{position_name}: #{position_diff[:old]} -> #{position_diff[:new]}\n"
    end
  end
end
