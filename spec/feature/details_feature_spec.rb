require 'rails_helper'

RSpec.describe 'details index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Captain Bawa', email: 'captain@example.com', password: 'test2024',
                        password_confirmation: 'test2024')
    @category = Category.create(name: 'FastFood', icon: 'icon.svg', user: @user)
    @detail = Detail.create(name: 'Fast', amount: 20, user: @user)
    @user.confirm
    sign_in @user
    visit category_details_path(@category)
  end

  it 'displays category name' do
    expect(page).to have_content(@category.name)
  end

  it 'displays detail name' do
    expect(page).to have_content(@detail.name)
  end

  it 'display transections text' do
    expect(page).to have_content('DETAILS')
  end

  it 'calculate the totel' do
    expect(page).to have_content(@category.details.sum(:amount))
  end
end
