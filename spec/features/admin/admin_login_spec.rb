require 'rails_helper'

describe 'User' do
  it 'admin can sign in' do
    user = User.create(email: 'admin@email.com', password:'admin', role: 1)

    visit '/'

    expect(current_path).to eq(root_path)

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(user.email)
  end
end
