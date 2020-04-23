Alchemy::Engine.routes.draw do


  namespace :admin do
    resources :pictures do
      resource :crop, module: :pictures, only: :create
    end
  end


end
