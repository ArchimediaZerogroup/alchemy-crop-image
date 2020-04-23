module Alchemy
  module Admin
    module Pictures
      class CropsController < Alchemy::Admin::BaseController

        before_action :load_original_picture


        def create
          @picture = Picture.new(picture_params)
          authorize! :create, @picture
          if !params[:image_info].nil?
            puts params[:image_info]
            width = params[:image_info][:width]
            height = params[:image_info][:height]

            @picture.name = "#{@original_picture.name}_#{width}x#{height}"
          else
            @picture.name = "#{@original_picture.name}_#{SecureRandom.hex}"
          end
          @picture.image_file_name = @picture.name
          @picture.tag_list = @original_picture.tag_list + ["#{width}x#{height}"]
          if @picture.save
            flash.notice = Alchemy.t(:cropped_image_succesfully_save, scope: :alchemy_crop_image)
            redirect_to admin_pictures_path(filter: "last_upload")
          else
            flash[:error] = Alchemy.t(:cropped_image_not_saved, scope: :alchemy_crop_image)
            redirect_to admin_pictures_path
          end
        end


        private

        def load_original_picture
          @original_picture = Alchemy::Picture.find params[:picture_id]
        end

        def picture_params
          params.require(:picture).permit(:image_file)
        end

      end
    end
  end
end