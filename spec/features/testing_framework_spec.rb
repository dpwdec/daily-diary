feature 'testing framework' do
  scenario 'it shows testing framework' do
    visit('/')
    expect(page).to have_content('testing framework working')
  end
end
