class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page],per_page: 7)
  end
end
