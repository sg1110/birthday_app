feature 'Enter your name' do
  scenario 'When todays date is entered it redirects to congrats page' do
    visit('/')
    fill_in :entered_name, with: 'Saule'
    fill_in :entered_date, with: '2019-01-24'
    click_button 'Go!'
    save_and_open_page
    expect(page).to have_content 'Happy Birthday Saule!'
  end
end
