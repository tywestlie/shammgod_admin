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

    expect(current_path).to eq(article_path(article1.id))

    expect(page).to have_content(article1.title)
    expect(page).to have_content(article1.body)
  end

  it 'admin can create a new article' do
    admin = User.create(email: 'admin@gmail.com', password:'admin', role: 1)
    title = 'A Great Title'
    body = 'Look at all this text!!!!'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit dashboard_path

    click_on 'New Article'

    expect(current_path).to eq(new_article_path)

    fill_in 'article[title]', with: title
    fill_in 'article[body]', with: body

    click_on 'Create Article'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(title)
  end
end
