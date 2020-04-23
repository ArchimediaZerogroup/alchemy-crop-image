class Alchemy::Crop::Image::InstallGenerator < Rails::Generators::Base


  desc "Add yarn needed packages"

  def run_yarn_add
    run("yarn add cropperjs@1.5.6")
  end


  desc "Add required assets"

  def add_required_assets
    if Gem::Version.new(Rails.version) >= Gem::Version.new("6.0.0") and Alchemy.gem_version > Gem::Version.new("4.5.0")

      prepend_to_file "app/javascript/packs/alchemy/admin.js" do
        "\nrequire('alchemy/crop/image/application')\n"
      end

      inject_into_file "vendor/assets/stylesheets/alchemy/admin/all.css", after: ' *= require alchemy/admin/alchemy-devise' do
        "\n*= require alchemy/crop/image/application\n"
      end

    else
      inject_into_file "vendor/assets/javascripts/alchemy/admin/all.js", after: '//= require alchemy/admin' do
        "\n//= require alchemy/crop/image/application\n"
      end

      inject_into_file "vendor/assets/stylesheets/alchemy/admin/all.css", after: ' *= require alchemy/admin/alchemy-devise' do
        "\n*= require alchemy/crop/image/application\n"
      end

    end
  end




end
