require 'rails_helper'

RSpec.describe 'Songs Index', type: :feature do
# As a user, 
# when I visit '/songs' 
# I see each song's title and play count
  describe 'as a user' do
    describe 'when I visit /songs' do
      it 'shows each song and play count' do
        artist = Artist.create!(name: "Carly Rae Jepsen")
        song = artist.songs.create!(title: "I Really Like you", length: 456, play_count: 6578)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 456, play_count: 8678)

        visit '/songs'
        expect(page).to have_content(song.title)
        expect(page).to have_content(song_2.title)
        expect(page).to have_content(song.play_count)
        expect(page).to have_content(song_2.play_count)
      end
    end
  end
end