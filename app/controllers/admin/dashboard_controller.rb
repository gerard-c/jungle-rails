class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_NAME'], password: ENV['AUTH_PASSWORD']

  def show
    @product_count = Product.count
    @category_count = Category.count
    puts "Products: ", @product_count
    puts "Categories: ", @category_count
  end
end
