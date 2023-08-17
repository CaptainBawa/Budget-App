require 'rails_helper'

describe Category, type: :request do
  before(:each) do
    @user = User.create(name: 'Captain Bawa', email: 'example@example.com', password: 'test2024',
                        password_confirmation: 'test2024')
    @category = Category.create(name: 'FastFood', icon: 'icon.svg')

    get authenticated_root_path
  end

  it 'should epect resposes to be successful' do
    expect(response).to be_successful
  end

  it 'should render user name' do
    expect(@user.name).to eq('Captain Bawa')
  end

  it 'should render category name' do
    expect(@category.name).to eq('FastFood')
  end
end
