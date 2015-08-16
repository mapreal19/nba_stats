require 'httparty'

module NbaStats
  class Base
    include HTTParty
    base_uri 'stats.nba.com/stats'

    private

    class << self
      # Try to guess the current season
      #
      #   'August 2015' # => 2015-16
      #   'July 2015' # => 2014-15
      def guess_current_season
        current_year = Time.now.year
        first_year_season = Time.now.month < 8 ? current_year - 1 : current_year
        next_year_season = (first_year_season + 1).to_s[-2..-1]

        "#{first_year_season}-#{next_year_season}"
      end

      # Header downcased and converted into symbol
      #
      #   'TEAM_NAME' # => :team_name
      def normalized_header
        proc { |header| header.downcase.to_sym }
      end
    end
  end
end
