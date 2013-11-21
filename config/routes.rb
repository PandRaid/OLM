OLM::Application.routes.draw do
  get "users/user"
  get "books/index"
  get "dashboard/index"
  get "static_pages/contact"
  get "static_pages/about"
  get "static_pages/faq"

  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'users/:new' => 'users#new'
  get 'login/:new' => 'login#new'
  post 'login/:new' => 'login#create'
  delete 'login/:new' => 'login#destroy'
  delete '/#' => 'login#destroy'

  get 'upload/pdfview' => 'upload#pdfview'
  get 'upload/fileform' => 'upload#fileform'
  get 'upload/search' => 'upload#search'
  post 'upload/fileupload' => 'upload#fileupload'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  Rails.application.routes.draw do
  resources :users # or resource :user for singular resources
  resources :login
  end

  namespace :admin do
    get "manage_users/list", to: 'manage_users#list', as: '/manage_users/list'
    get 'dashboard/index', to: 'dashboard#show', as: '/'
    post 'manage_users/list'
  end

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
