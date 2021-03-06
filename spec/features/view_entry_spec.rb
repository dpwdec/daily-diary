feature 'view a specific entry' do
  scenario 'user clicks on title to see entry' do
    populate_database
    visit('/entries')
    click_link('Day 2 my first pikachu')
    expect(page).to have_content('On my second day I met a pikachu!')
  end

  scenario 'user can return from entry to entries page' do
    populate_database
    visit('/entries')
    click_link('Day 2 my first pikachu')
    click_link('back')
    expect(page).to have_current_path('/entries')
  end
end
