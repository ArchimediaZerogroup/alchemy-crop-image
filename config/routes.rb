Rails.application.routes.draw do


  namespace :alchemy do
    namespace :admin do
      resources :pictures do
        resource :crop, module: :pictures, only: :create
      end
    end
  end


end
