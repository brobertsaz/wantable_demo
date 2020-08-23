class ReportsController < ApplicationController
  def index; end

  def coupon_search
    @coupon = Coupon.find params[:coupon_id]
    respond_to do |format|
      format.js { render layout: false}
    end
  end

  def product_sales_search
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    @products = Product.select{|p| p.order_items.where(created_at: start_date...end_date).size > 0}

    respond_to do |format|
      format.js { render layout: false}
    end
  end
end
