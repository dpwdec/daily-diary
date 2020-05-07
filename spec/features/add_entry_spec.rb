feature 'create diary entry' do
  scenario 'user adds body and title' do
    visit('/add-entry')
    fill_in('title', with: 'Day 1 at Pokemon Academy')
    fill_in('body', with: 'On my first day at pokemon trainer school.')
    click_button('submit')
    expect(page).to have_content('Day 1 at Pokemon Academy')
    expect(page).to have_content('On my first day at pokemon trainer school.')
  end
end
