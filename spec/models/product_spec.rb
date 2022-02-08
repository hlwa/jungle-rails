require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves successfully with all four fields set and belong to a category' do
      @product = Product.new
      @category = Category.new
      @product.name = '1'
      @product.price_cents = 12
      @product.quantity =3
      @product.category = @category
      expect(@product.valid?).to be true
    end

    it "name validates" do
      @product = Product.new
      @product.name = nil # invalid state
      @product.valid?
      expect(@product.errors[:name]).to  include("can't be blank")
  
      @product.name = 'test' # valid state
      @product.valid? 
      expect(@product.errors[:name]).not_to  include("can't be blank")
    end

    it "price validates" do
      @product = Product.new
      @product.price_cents = nil # invalid state
      @product.valid?
      expect(@product.errors[:price_cents]).to  include("is not a number")
  
      @product.price_cents = 11 # valid state
      @product.valid? 
      expect(@product.errors[:price_cents]).not_to  include("is not a number")
    end

    it "category validates" do
      @product = Product.new
      @category = Category.new
      @product.category = nil # invalid state
      @product.valid?
      expect(@product.errors[:category]).to  include("can't be blank")
  
      @product.category = @category # valid state
      @product.valid? 
      expect(@product.errors[:category]).not_to  include("can't be blank")
    end

    it "quantity validates" do
      @product = Product.new
      @product.quantity = nil # invalid state
      @product.valid?
      expect(@product.errors[:quantity]).to  include("can't be blank")
  
      @product.quantity = 11 # valid state
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("can't be blank")
    end



  end
end