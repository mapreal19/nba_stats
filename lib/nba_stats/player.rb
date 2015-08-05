module NbaStats
  class Player < Base
    def initialize(league_id: '00', season: guess_current_season, is_only_current_season: 1)
      @options = {query: {LeagueId: league_id, Season: season, IsOnlyCurrentSeason: is_only_current_season}}
    end

    # Gets all the players from the NBA
    #
    #  player.all # => [{:person_id=>203092, :display_last_comma_first=>"Zeller, Tyler", ...}, ...]
    def all
      response = self.class.get('/commonallplayers/', @options)['resultSets'].first

      headers = response['headers'].map!(&normalized_header)
      players = response['rowSet']

      players.each_with_object([]) do |player, players_with_headers|
        players_with_headers << Hash[headers.zip(player)]
      end
    end
  end
end
