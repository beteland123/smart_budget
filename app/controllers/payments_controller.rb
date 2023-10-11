class PaymentsController < ApplicationController
  # before_action :set_category, only: %i[ new create]

  def index
    @category = Category.find(params[:category_id])
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end

  def new
    @current_user = current_user
    @category = Category.find(params[:category_id])
    @payment = @current_user.payments.new(category: @category)
    @available_categories = Category.all
  end

  def create
    @current_user = current_user
    @category = Category.find(params[:category_id])
    @payment = @current_user.payments.new(payments_params)
    @payment.category = @category

    if @payment.save
      redirect_to category_payments_path(@category), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  def show
    @current_user = current_user
    @category = Category.find(params[:category_id])
    @payment = @category.payments.find(params[:id])
  end

  private

  def payments_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
