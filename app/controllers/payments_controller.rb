class PaymentsController < ApplicationController
    before_action :set_category, only: %i[ new create]

    def index
        @category = Category.includes(:payments).find(params[:category_id])
        @payments = @category.payments.order(created_at: :desc)
        @total_amount = @payments.sum(:amount)
    end
    def new
        @current_user = current_user
        @category = Category.find(params[:category_id])
        @payments = @current_user.payments.new(category: @category)
    end
    def create
        @current_user = current_user
        @category = Category.find(params[:category_id])
        @payments = @current_user.payments.new(transaction_params)
        @payments.category = @category
    
        if @payments.save
          redirect_to category_payments_path(@category), notice: 'Transaction was successfully created.'
        else
          render :new
        end
      end
    
      private
    
      def transaction_params
        params.require(:transaction).permit(:name, :amount, :category_id)
      end
      def set_category
          @category = Category.find(params[:id])
      end
end
