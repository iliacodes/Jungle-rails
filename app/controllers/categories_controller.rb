class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(name: :asc)
  end

end