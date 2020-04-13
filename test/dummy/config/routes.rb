Rails.application.routes.draw do
  mount Alchemy::Crop::Image::Engine => "/alchemy-crop-image"
end
