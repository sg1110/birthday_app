feature 'Enter your name' do
  scenario 'Can submit a name' do
    visit('/')
    fill_in :entered_name, with: 'Saule'
    click_button 'submit'
    expect(page).to have_content 'Happy Birthday Saule!'
  end
end
