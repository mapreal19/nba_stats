require 'spec_helper'

describe NbaStats::Player do
  it { is_expected.to respond_to(:all) }

  describe '#all', :vcr do
    it 'parses the api response from JSON to Array' do
      all_players = subject.all
      expect(all_players).to be_an Array
    end
  end
end
