Rails.application.routes.draw do
  root 'admin#index'

  resources :orders, only: [:index, :show], param: :number do
    get :cancel_order
    collection do
      get :reset_search
    end
  end

  resources :reports, only: :index do
    collection do
      post :product_sales_search
      post :coupon_search
    end
  end
end
