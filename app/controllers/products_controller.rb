class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @reviews = Review.where(product_id: params[:id])

    if(current_user)
     @review = Review.new(product_id: @product.id, user_id: current_user.id)
    end
  end

end
