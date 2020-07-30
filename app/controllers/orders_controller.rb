class OrdersController < ApplicationController
  include Pagy::Backend
  before_action :find_order!, only: :show

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
    @pagy, @orders = pagy(@orders, items: 10)
  end

  def show
  end

  def cancel_order
    @order = Order.find_by!(number: params[:order_number])
    @order.update state: 'canceled'
    redirect_to action: :index
  end

  def reset_search
    @q = Order.ransack(nil)
    @orders = @q.result(distinct: true)
    redirect_to action: :index
  end

  private
  def find_order!
    @order = Order.find_by!(number: params[:number])
  end
end
