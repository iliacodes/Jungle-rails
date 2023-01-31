require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  
    it "is valid" do
      @product = Product.new
      @category = Category.new
      @category.name = 'testing'
      @product.name = 'testing' 
      @product.price = 111
      @product.quantity = 1
      @product.category = @category
      expect(@product.valid?).to be true
    end

    it "name not set" do
      @product = Product.new
      @category = Category.new
      @category.name = 'testing'
      @product.name = nil
      @product.price = 111
      @product.quantity = 1
      @product.category = @category
      @product.valid?
      expect(@product.errors[:name]).to  include("can't be blank")

    end

    it "price not set" do
      @product = Product.new
      @category = Category.new
      @category.name = 'testing'
      @product.name = 'testing' 
      @product.price_cents = nil
      @product.quantity = 1
      @product.category = @category
      @product.valid?
      #puts @product.errors.full_messages
      expect(@product.errors[:price_cents]).to  include("is not a number")

    end
  
    it "quantity no set" do
      @product = Product.new
      @category = Category.new
      @category.name = 'testing'
      @product.name = 'testing' 
      @product.price = 111
      @product.quantity = nil
      @product.category = @category
      @product.valid?
      #puts @product.errors.full_messages
      expect(@product.errors[:quantity]).to  include("can't be blank")

    end
  
    it "category_id not set" do
      @product = Product.new
      @category = Category.new
      @category.name = 'testing'
      @product.name = 'testing'
      @product.price = 111
      @product.quantity = 1
      @product.category = nil
      @product.valid?
      #puts @product.errors.full_messages
      expect(@product.errors[:category]).to  include("must exist")
    end

  end
end
