require 'rails_helper'

RSpec.describe 'Artists Songs Index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple =  @prince.songs.create!(title: 'Purple Rain', length: 624, play_count: 5428)
    @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 588, play_count: 5384)
    

  end
  it 'shows all songs for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows average song length for the artist' do 
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 606")
  end
end