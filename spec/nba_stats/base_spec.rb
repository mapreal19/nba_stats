require 'spec_helper'

describe NbaStats::Base do

  describe 'normalized_headers' do
    it 'returns the header normalized' do
      header = 'TEAM_NAME'
      normalized_header = described_class.send(:normalized_header).call(header)

      expect(normalized_header).to eq :team_name
    end
  end

  describe 'guess_current_season' do
    context 'August 2015' do
      before do
        Timecop.freeze(Time.local(2015, 8))
      end

      it 'returns the guessed season' do
        expect(described_class.send(:guess_current_season)).to eq '2015-16'
      end
    end

    context 'July 2015' do
      before do
        Timecop.freeze(Time.local(2015, 7))
      end

      it 'returns the guessed season' do
        expect(described_class.send(:guess_current_season)).to eq '2014-15'
      end
    end
  end
end
