require 'spec_helper'

describe NbaStats::Player, :vcr do

  describe 'Class Methods' do
    describe '.all' do
      it 'parses the api response from JSON to Array' do
        all_players = described_class.all
        expect(all_players).to be_an Array
      end
    end
  end

  describe 'Instance Methods' do
    subject(:player) { described_class.new(id: 1717) }

    describe '#attributes' do
      subject {player.attributes}

      it 'not nil' do
        expect(subject).not_to be nil
      end

      it 'returns a Hash' do
        expect(subject).to be_an_instance_of(Hash)
      end
    end
  end
end
