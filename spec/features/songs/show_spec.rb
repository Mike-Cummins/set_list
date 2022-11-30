require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title, length, play count' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like you", length: 456, play_count: 6578)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 456, play_count: 8678)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to have_content(song.length)
    expect(page).to have_content(song.play_count)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like you", length: 456, play_count: 6578)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 456, play_count: 8678)
    visit "/songs/#{song.id}"
  
    expect(page).to have_content(artist.name)
  end

  it 'has a link back to the index' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like you", length: 456, play_count: 6578)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 456, play_count: 8678)
    visit "/songs/#{song.id}"

    expect(page).to have_link('Song Index', href: '/songs')
  end
end