PaperclipDemo::Application.routes.draw do
  resources :complete do
  	post :index, on: :collection, as: :index
  end

  resources :friends
  
  get 'friends/index'
  post 'friends/index'
  root :to => 'friends#index'
   	
end
