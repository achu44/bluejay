Swap::Application.routes.draw do
  
  devise_for :users, path_names: { sign_out: "logout"},
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  match 'users/auth/facebook/callback', to: 'sessions_facebook#create'
  match 'auth/failure', to: redirect('/')
  match 'logout', to: 'sessions_facebook#destroy', as: 'logout'

  #devise_for :users do
    #match '/users/sign_out' => "devise/sessions#destroy"
    #get "/login" => "devise/sessions#new"
  # end

  resources :users
  resources :items

  devise_scope :user do 
    root :to => "main#main"
  end

  root :to => "main#about"

  get 'tags/:tag', to: 'items#index', as: :tag

  # for the Main controller
  match 'home', :to => "main#home"
  match 'main', :to => "main#main"
  match 'signup', :to => "main#signup"
  match 'howitworks', :to => "main#how_it_works"
  match 'about', :to => "main#about"
  match 'sell', :to => "items#new"
  match 'itemslist', :to => "items#itemslist"

  #for the Contact controller
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
