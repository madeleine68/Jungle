require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do

    

    it "name presence" do
      @product = Product.new
      @product.name = nil  #invalid
      @product.valid?
      expect(@product.errors[:name]).to include("can't be blank")

      @product.name = 'test' #valid
      @product.valid?
      expect(@product.errors[:name]).not_to include("can't be blank")
    end    

    it "price_cents presence" do
      @product = Product.new
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors[:price_cents]).to include("is not a number")

      @product.price_cents = 9.99
      @product.valid?
      expect(@product.errors[:price_cents]).not_to include("can't be blank")
    end 

    it "quantity presence" do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to include("can't be blank")

      @product.quantity = 20
      @product.valid?
      expect(@product.errors[:quantity]).not_to include("can't be blank")
    end 

    it "category_id " do
      @product = Product.new
      @category = Category.new

      @product.category = nil
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")

      @product.category = @category
      @product.valid?
      expect(@product.errors[:category]).not_to include("can't be blank")
    end 

    it "is valid" do
      @product = Product.new
      @category = Category.new
      @category.name = 'test'
      @product.name = 'test' # invalid state
      @product.price_cents = 9.99
      @product.quantity = 20
      @product.category = @category
      expect(@product.valid?).to be true
    end
  end  
end
