require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Captain Bawa', email: 'example@example.com', password: 'test2024')

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'validate the email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'validate the password' do
    user.password = nil
    expect(user).to_not be_valid
  end
end
