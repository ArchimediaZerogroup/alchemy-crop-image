module Alchemy
  module Crop
    module Image
      class Engine < ::Rails::Engine
        isolate_namespace Alchemy::Crop::Image
      end
    end
  end
end
