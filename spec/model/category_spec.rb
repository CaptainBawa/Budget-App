require 'rails_helper'

RSpec.describe Category, type: :model do
  category = Category.create(name: 'FastFood', icon: 'icon.svg')

  it 'is not valid without a name' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category.icon = nil
    expect(category).to_not be_valid
  end
end
