require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new
      @product = Product.new
      @product.name = 'example name'
      @product.price_cents = 42
      @product.quantity = 13
      @product.category_id = 1
    end

    context 'add product without name' do
      it 'throws error referring to name' do
        @product.name = nil
        @product.save
        expect(@product.errors.full_messages).to include('Name can\'t be blank')
      end
    end

    context 'add product without price' do
      it 'throws error referring to blank price' do
        @product.price_cents = nil
        @product.save
        expect(@product.errors.full_messages).to include('Price can\'t be blank')
      end
    end

    context 'add product without quantity' do
      it 'throws error referring to blank quantity' do
        @product.quantity = nil
        @product.save
        expect(@product.errors.full_messages).to include('Quantity can\'t be blank')
      end
    end

    context 'add product without category' do
      it 'throws error referring to category' do
        @product.category_id = nil
        @product.save
        expect(@product.errors.full_messages).to include('Category can\'t be blank')
      end
    end
  end
end
