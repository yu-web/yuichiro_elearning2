class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = @category.words.paginate(page: params[:page],per_page: 4)
    
  end

  

  def new
    @category=Category.find(params[:category_id])
    @word = @category.words.build
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(words_params)

    if @word.save
      flash[:success] = "Successfully Create Word"
      redirect_to admin_category_words_url
    else
      render "new"
    end
  end

  def destroy
    @category=Category.find(params[:category_id])
    @word = @category.words.find(params[:id]).destroy
    redirect_to admin_category_words_url
  end

  def edit
    @category=Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
  end

  def update
    @category=Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
    if @word.update(words_params)
      flash[:success]="Updated"
      redirect_to admin_category_words_url
    else
      render "edit"
    end
  end
  


  private
  def words_params
    params.require(:word).permit(:content, choices_attributes: [:id,:content,:isCorrect])
  end
end
