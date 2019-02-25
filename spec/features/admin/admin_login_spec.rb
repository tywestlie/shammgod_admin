require 'rails_helper'

describe 'User' do
  it 'admin can sign in' do
    admin = User.create(email: 'admin@email.com', password:'admin', role: 1)

    visit '/'

    expect(current_path).to eq(root_path)


    fill_in 'email', with: admin.email
    fill_in 'password', with: admin.password

    click_on 'Log In'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(admin.email)
  end

  # it 'only admins can log in' do
  #
  # end
end
