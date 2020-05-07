feature 'create diary entry' do
  scenario 'user adds diary entry' do
    visit('/add-entry')
    fill_in('body', with: 'On my first day at pokemon trainer school.')
    click_button('submit')
    expect(page).to have_content('On my first day at pokemon trainer school.')
  end
end
