module Spree
  class AddToCartController < StoreController
    skip_before_action :verify_authenticity_token, only: [:create]
    include Spree::ProductsHelper
    include Spree::FrontendHelper

    def index
    end

    def create
      variant = Spree::Variant.find(params[:variant])

      @product = variant
      Spree::Cart::AddItem.call(order: current_order, variant: variant, quantity: 1)
      flash[:success] = "#{ variant.name } Add to Cart"
      redirect_back(fallback_location: root_path)
    end
  end

end

