class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['AUTHENTICATION_USERNAME'], :password => ENV['AUTHENTICATION_PASSWORD']
  def show
    @products = Product.all.order(created_at: :desc)
    @counts = @products.count
    @categories = Category.all
    @c_count = @categories.count
  end
end
