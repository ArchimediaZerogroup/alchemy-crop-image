module Alchemy
  module Crop
    module Image
      class ApplicationController < ActionController::Base
        protect_from_forgery with: :exception
      end
    end
  end
end
