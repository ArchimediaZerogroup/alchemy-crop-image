Rails.application.routes.draw do

  mount Alchemy::Crop::Image::Engine => "/"
  mount Alchemy::Engine => '/'


end
