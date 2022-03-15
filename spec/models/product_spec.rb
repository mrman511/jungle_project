require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do 
      @category = Category.new
    end
    it 'product of all for fields have been set and saved' do
      @product = Product.new(name: 'chair', price: 100, quantity: 5, category: @category)
      expect(@product.save).to be true
    end
    it 'Validates presence of name' do
      @product = Product.new(name: nil, price: 100, quantity: 5, category: @category)
      expect(@product.errors.full_messages).to be_instance_of Array 
    end
    it 'Validates presence of price' do
      @product = Product.new(name: 'chair', price: nil, quantity: 5, category: @category)
      expect(@product.errors.full_messages).to be_instance_of Array 
    end
    it 'Validates presence of quantity' do
      @product = Product.new(name: 'chair', price: 100, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to be_instance_of Array 
    end
    it 'Validates presence of category' do
      @product = Product.new(name: 'chair', price: 100, quantity: 5, category: nil)
      expect(@product.errors.full_messages).to be_instance_of Array 
    end
  end
end
