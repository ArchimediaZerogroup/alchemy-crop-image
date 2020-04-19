module Alchemy
  module Crop
    module Image
      class Configuration

        cattr_accessor :available_preset_cropbox
        @@available_preset_cropbox = [
            {
                value: 16.0 / 9.0,
                label: "16:9"
            },
            {
                value: (4.0 / 3.0),
                label: "4:3"
            }]

        def self.set
          yield self
        end
      end
    end
  end
end