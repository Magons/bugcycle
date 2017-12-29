class CategoriesController < ApplicationController
  before_action :authenticate_user!

  respond_to :json

  def create
    @category = Category.new(category_params)
    respond_with @category
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
