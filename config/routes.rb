SchmidtFamilyFarms::Application.routes.draw do
  resources :customer_orders

  root 'public#index'
  get '/index'              => 'public#index' 
  get '/about'              => 'public#about'
  get '/products'           => 'public#products'
  get '/products/beef'      => 'public#beef'
  get '/products/pork'      => 'public#pork'
  get '/products/chicken'   => 'public#chicken'
  get '/products/lamb'      => 'public#lamb'
  get '/services'           => 'public#services'
  get '/order'              => 'public#order'
  post '/order'             => 'public#order_post'
  get '/news'               => 'public#news'
  get '/faq'                => 'public#faq'
  get '/contact'            => 'public#contact'
  get '/admin_login'        => 'public#admin_login'
  post '/admin_login'       => 'public#admin_login_post'
  get '/admin_logout'       => 'public#admin_logout'

  get '/test'               => 'public#test'

  get '/admin_index'        =>'admin#admin_index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
