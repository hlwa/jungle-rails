class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def index
    @categories = Category.all.order(created_at: :desc)
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end
end
