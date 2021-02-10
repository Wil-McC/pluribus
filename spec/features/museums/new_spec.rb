require 'rails_helper'

RSpec.describe 'new museum form page' do
  it 'has new museum form element' do
    visit '/museums/new'

    expect(page).to have_content("Enter a new museum:")
  end

  it 'redirects and shows created museum in index' do
    visit '/museums/new'

    fill_in 'museum[name]', with: 'Raymanta'
    check 'museum[open]'
    fill_in 'museum[cost]', with: 12

    click_button 'Create Museum'

    expect(current_path).to eq('/museums')
    expect(page).to have_content('Raymanta')
  end
  # story 22
  it 'has a child index link' do
    visit "/museums/new"

    expect(page).to have_link('Artifact Index')

    click_link 'Artifact Index'

    expect(current_path).to eq('/artifacts')
  end
  #story 23
  it 'has a parent index link' do
    visit "/museums/new"

    expect(page).to have_link('Museum Index')

    click_link 'Museum Index'

    expect(current_path).to eq('/museums')
  end
end
