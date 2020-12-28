Spree::Core::Engine.add_routes do
  post 'add_item_to_cart/', to: 'add_items#create', as: 'quick_add'
  get 'parts-and-accessories', to: 'add_items#index'
  resources :add_items, only: [:index, :create]
end
