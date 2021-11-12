class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['NAME'].to_s, password: ENV['PASSWORD'].to_s

  def show
    @product_count = Product.count
    @categories_count = Category.count
  end
end
