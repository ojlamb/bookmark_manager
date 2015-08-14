require 'spec_helper'

feature 'creating new links with tags' do

  scenario 'there are no links in the database at the start of the test' do
    expect(Link.count).to eq 0
  end

  scenario 'can create a new link' do
    environment_setter
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end

  scenario 'can add single tag to a new link' do
    environment_setter
    link = Link.first
    expect(link.tags.map(&:name)).to include('stupid') # link.tags.map {|x| x.name}
  end

  scenario 'it can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tag', with: 'stupid waster'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('stupid', 'waster')
  end
end

def environment_setter
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    fill_in 'tag', with: 'stupid'
    click_button 'Create link'
end
