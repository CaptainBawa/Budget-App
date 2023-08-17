require 'rails_helper'

RSpec.describe 'categories index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Captain Bawa', email: 'captain@example.com', password: 'test2024',
                        password_confirmation: 'test2024')
    @category = Category.create(name: 'FastFood', icon: 'icon.svg', user: @user)
    @user.confirm
    sign_in @user
    visit authenticated_root_path
  end

  it 'displays category name' do
    expect(page).to have_content(@category.name)
  end

  it 'displays user name' do
    expect(page).to have_content(@user.name)
  end

  it 'display transections text' do
    expect(page).to have_content('TRANSECTION')
  end

  it 'calculate the totel' do
    expect(page).to have_content(@category.details.sum(:amount))
  end

  it 'display view details text' do
    expect(page).to have_content('View details')
  end

  it 'can click "View details" link' do
    click_link 'View details'
    expect(page).to have_current_path(category_details_path(@category))
    expect(page).to have_content('Transections for')
  end
end
