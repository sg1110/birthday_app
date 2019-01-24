require 'date'

feature 'Enter your name' do
  scenario 'When todays date is entered it redirects to congrats page' do
    visit('/')
    fill_in :entered_name, with: 'Charlie'
    fill_in :entered_date, with: Date.today.to_s
    click_button 'Go!'
    save_and_open_page
    expect(page).to have_content 'Happy Birthday Charlie!'
  end
end
#tests missing for:
#no input
#future, day
#date of birth - years....
#current entry tells how old they will be, not how many days are left
#extract calculations into lib rb file
