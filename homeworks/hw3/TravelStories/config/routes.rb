Rails.application.routes.draw do
  get 'pages/new'

  get 'pages/show'

  root 'static_pages#home'

  get 'static_pages/browse'

  get 'static_pages/search'

  get 'static_pages/create'

  get 'static_pages/about'

  get 'login' => 'static_pages#login'

  get 'login_new' => 'users#new'

  get 'login_existing' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  get 'stories/new'

  get 'stories/create'

  get 'display_story_links/byName'

  get 'display_story_links/byAuthor'

  get 'display_story_links/byLocation'

  get 'display_story_links/byTravelCategory'

  get 'display_story_links/byStoryType'

  get 'text_elements/new'

  get 'image_elements/new'

  get 'pages/prev'

  get 'pages/next'

  get 'stories/done'

  resources :users

  resources :stories

  resources :pages

  resources :text_elements

  resources :image_elements

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
