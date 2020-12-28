module Spree
  class AddItemsController < Spree::StoreController
    include Spree::ProductsHelper
    include Spree::FrontendHelper
    before_action :load_taxon

    def create
      find_variant = params[:variant]
      variant = Spree::Variant.find(find_variant)
      unless current_order.present?
        Spree::Order.create
      end
      Spree::Cart::AddItem.call(order: current_order, variant: variant,  quantity: 1)
      redirect_to '/parts-and-accessories'
      flash[:success] = "Added #{ variant.name } to your cart"
    end

    def index
      @categories = Spree::Taxon.find_by(name: 'Parts & Accessories')
    end

    private

    def load_taxon
      @taxon = Spree::Taxon.friendly.find_by(permalink: 'parts-and-accessories')
    end
  end
end

