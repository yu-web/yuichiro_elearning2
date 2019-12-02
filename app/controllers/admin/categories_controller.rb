class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page],per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category=Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Create Category"
      redirect_to admin_categories_url
    else
      render "new"
    end
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update
    @category=Category.find(params[:id])
    if @category.update(category_params)
      flash[:success]="Updated"
      redirect_to admin_categories_url
    else
      render "edit"
    end
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Deleted"
    redirect_to admin_categories_url
  end

  def category_params
    params.require(:category).permit(:name,:content)
  end
end
