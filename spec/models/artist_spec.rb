require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'Instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple =  @prince.songs.create!(title: 'Purple Rain', length: 624, play_count: 5428)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 588, play_count: 3944)
        @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 5983)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(404.33)
      end  
    end
  end
end