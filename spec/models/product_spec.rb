require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: "new_category")
      @product = Product.new
      @product.name = "new_product"
      @product.price = 1
      @product.quantity = 1
      @product.category_id = @category.id
      @product.valid?
    end

    it "should create a new product" do
      expect(@product).to be_valid
    end

    it "should have a name" do
      expect(@product.name).to_not be_nil
    end

    it "should belong to a category" do
      @product.category_id = nil
      @product.save
      expect(@product.errors.full_messages[0]).to include(@product.errors[:category][0])
    end

    it "should have a price cause ain't shit for free" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages[0]).to include(@product.errors[:price][0])
    end

    it "should have a quanity greater than 0" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages[0]).to include(@product.errors[:quantity][0])
    end
  end
end
