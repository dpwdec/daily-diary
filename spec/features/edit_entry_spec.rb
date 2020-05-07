feature 'edit entries' do
  scenario 'user can edit an existing entry' do
    populate_database
    visit('/entries')
    click_link('Day 1 at Pokemon Academy')
    click_link('edit')
    fill_in('body', with: 'On my first day at pokemon trainer school I caught a magikarp.')
    click_button('save')
    click_link('Day 1 at Pokemon Academy')
    expect(page).to have_content('On my first day at pokemon trainer school I caught a magikarp.')
  end
end
