require 'rails_helper'

describe 'Admin Visits Dashboard' do
  it 'admin sees a list of blog titles' do
    admin = User.create(email: 'admin@gmail.com', password:'admin', role: 1)
    article1 = admin.articles.create(title: 'test1', body: 'test1')
    article2 = admin.articles.create(title: 'test2', body: 'test2')
    article3 = admin.articles.create(title: 'test3', body: 'test3')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    visit dashboard_path

    within(".articles") do
      expect(page).to have_content(article1.title)
      expect(page).to have_content(article2.title)
      expect(page).to have_content(article3.title)
    end
  end

  it 'admin can link to an article page' do
    admin = User.create(email: 'admin@gmail.com', password:'admin', role: 1)
    article1 = admin.articles.create(title: 'test1', body: 'test1')
    article2 = admin.articles.create(title: 'test2', body: 'test2')
    article3 = admin.articles.create(title: 'test3', body: 'test3')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    visit dashboard_path

    within(".articles") do
      expect(page).to have_content(article1.title)
      expect(page).to have_content(article2.title)
      expect(page).to have_content(article3.title)
    end

    click_on  article1.title
    expect(current_page).to eq()
  end
end
