module NbaStats
  class Player < Base
    attr_reader :attributes

    def initialize(id:, league_id: '00')
      @options = {query: {PlayerID: id, LeagueId: league_id}}

      @attributes = player_with_headers
    end

    class << self
      # Gets all the players from the NBA
      #
      #  player.all # => [{:person_id=>203092, :display_last_comma_first=>"Zeller, Tyler", ...}, ...]
      def all(league_id: '00', season: guess_current_season, is_only_current_season: 1)
        options = {
          query:
            {
              LeagueId: league_id,
              Season: season,
              IsOnlyCurrentSeason: is_only_current_season
            }
        }

        response = get('/commonallplayers/', options)['resultSets'].first

        headers = response['headers'].map!(&normalized_header)
        players = response['rowSet']

        players.each_with_object([]) do |player, players_with_headers|
          players_with_headers << Hash[headers.zip(player)]
        end
      end
    end

    def player_with_headers
      response = self.class.get('/commonplayerinfo/', @options)['resultSets'].first

      headers = response['headers'].map!(&self.class.normalized_header)
      player = response['rowSet'].first

      Hash[headers.zip(player)]
    end
    
    def foo_test
      2 + 4
    end
  end
end
