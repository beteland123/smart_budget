class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:welcome]
  before_action :set_category, only: %i[show destroy]
  def index
    @categories = current_user.categories.includes(:payments)
  end

  def new
    @current_user = current_user
    @categories = Category.new
  end

  def create
    @categories = current_user.categories.new(category_params)

    if @categories.save
      flash[:success] = 'categories saved successfully'
      redirect_to categories_url
    else
      flash.now[:error] = 'Error: categories could not be saved'
      render 'new'
    end
  end

  def destroy
    @category.payments.destroy_all

    if @category.destroy
      flash[:success] = 'categories deleted successfully'
    else
      flash[:error] = 'Error: categories could not be deleted'
    end

    redirect_to categories_url
  end

  def welcome
    @categories = Category.all
  end

  def set_category
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
