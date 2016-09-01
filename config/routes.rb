PaperclipDemo::Application.routes.draw do
  resources :complete do
  	post :index, on: :collection, as: :index
  end

  resources :friends
   	root :to => 'friends#index'
   	
end
