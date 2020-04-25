# Alchemy::Crop::Image
With this gem you can add cropping functionality into Alchemy Cms Image library

## Usage
In Alchemy Image Library, when you click on an image, on the left you can see a botton: enable editor.  
You can click on this button that enable editor panel.
You can crop, zoom in and zoom out the image and save as new image.  
When the new image is saved, a tag with its size is added.  
The original image tags are kept


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alchemy-crop-image', github: 'ArchimediaZerogroup/alchemy-crop-image', branch: 'master'
```

And then execute:
```bash
$ bundle
```

Run the generator
```bash
$ bin/rails g alchemy:crop:image:install
```

## Next development steps
* Add tests with rspec

## Contributing
You can contribute by forking the project and making merge requests 

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
