require 'nokogiri'
require 'open-uri'

module FollowDepthCharts
  module Parser

    def self.parse_espn(url)
      @espn_urls ||= get_espn_urls
      doc = Nokogiri::HTML(open(url))
      teams = []
      doc.css('tr.last').each do |row|
        team = make_team(row)
        teams << team
      end
    end

    private
    def self.make_team(row)
      team = Team.new(get_team(row))
      team.closer  = get_closer(row)
      team.next    = get_next(row)
      team.stealth = get_stealth(row)
      team.looming = get_looming(row)
      return team
    end

    def self.get_team(row)
      name_url = row.css('td').first.css('img').attribute('src').text
      @espn_urls[name_url]
    end

    def self.get_closer(row)
      row.css('td').children[3].text
    end

    def self.get_next(row)
      row.css('td').children[6].text
    end

    def self.get_stealth(row)
      row.css('td').children[9].text
    end

    def self.get_looming(row)
      row.css('td').children[12].text
    end

    def self.get_espn_urls
      {
        'http://a.espncdn.com/i/teamlogos/mlb/35/ari.gif' => 'Arizona Diamondbacks',
        'http://a.espncdn.com/i/teamlogos/mlb/35/atl.gif' => 'Atlanta Braves',
        'http://a.espncdn.com/i/teamlogos/mlb/35/bal.gif' => 'Baltimore Orioles',
        'http://a.espncdn.com/i/teamlogos/mlb/35/bos.gif' => 'Boston Red Sox',
        'http://a.espncdn.com/i/teamlogos/mlb/35/chc.gif' => 'Chicago Cubs',
        'http://a.espncdn.com/i/teamlogos/mlb/35/chw.gif' => 'Chicago White Sox',
        'http://a.espncdn.com/i/teamlogos/mlb/35/cin.gif' => 'Cincinnati Reds',
        'http://a.espncdn.com/i/teamlogos/mlb/35/cle.gif' => 'Cleveland Indians',
        'http://a.espncdn.com/i/teamlogos/mlb/35/col.gif' => 'Colorado Rockies',
        'http://a.espncdn.com/i/teamlogos/mlb/35/det.gif' => 'Detroit Tigers',
        'http://a.espncdn.com/i/teamlogos/mlb/35/hou.gif' => 'Houston Astros',
        'http://a.espncdn.com/i/teamlogos/mlb/35/kan.gif' => 'Kansas City Royals',
        'http://a.espncdn.com/i/teamlogos/mlb/35/laa.gif' => 'Los Angeles Angels',
        'http://a.espncdn.com/i/teamlogos/mlb/35/lad.gif' => 'Los Angeles Dodgers',
        'http://a.espncdn.com/i/teamlogos/mlb/35/mia.gif' => 'Miami Marlins',
        'http://a.espncdn.com/i/teamlogos/mlb/35/mil.gif' => 'Milwaukee Brewers',
        'http://a.espncdn.com/i/teamlogos/mlb/35/min.gif' => 'Minnesota Twins',
        'http://a.espncdn.com/i/teamlogos/mlb/35/nym.gif' => 'New York Mets',
        'http://a.espncdn.com/i/teamlogos/mlb/35/nyy.gif' => 'New York Yankees',
        'http://a.espncdn.com/i/teamlogos/mlb/35/oak.gif' => 'Oakland Athletics',
        'http://a.espncdn.com/i/teamlogos/mlb/35/phi.gif' => 'Philadelphia Phillies',
        'http://a.espncdn.com/i/teamlogos/mlb/35/pit.gif' => 'Pittsburgh Pirates',
        'http://a.espncdn.com/i/teamlogos/mlb/35/stl.gif' => 'St. Louis Cardinals',
        'http://a.espncdn.com/i/teamlogos/mlb/35/sdg.gif' => 'San Diego Padres',
        'http://a.espncdn.com/i/teamlogos/mlb/35/sfo.gif' => 'San Francisco Giants',
        'http://a.espncdn.com/i/teamlogos/mlb/35/sea.gif' => 'Seattle Mariners',
        'http://a.espncdn.com/i/teamlogos/mlb/35/tam.gif' => 'Tampa Bay Rays',
        'http://a.espncdn.com/i/teamlogos/mlb/35/tex.gif' => 'Texas Rangers',
        'http://a.espncdn.com/i/teamlogos/mlb/35/tor.gif' => 'Torono Blue Jays',
        'http://a.espncdn.com/i/teamlogos/mlb/35/was.gif' => 'Washington Nationals'
      }
    end
  end
end
