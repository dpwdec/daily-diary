feature 'view previous entries' do
  scenario 'entries page shows entry titles' do
    populate_database
    visit('/entries')
    expect(page).to have_content('Day 1 at Pokemon Academy')
    expect(page).to have_content('Day 2 my first pikachu')
    expect(page).to have_content('Day 3 meeting evee')
  end
end
