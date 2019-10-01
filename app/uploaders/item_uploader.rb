class ItemUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  #include CarrierWave::MiniMagick
  
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['item']
  
  # Choose what kind of storage to use for this uploader:
  #storage :file
  # storage :fog
 CarrierWave.configure do |config|
  config.cache_storage = :file
 end
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def store_dir
    #"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
   "default.png"
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end
   #process resize_to_fill: [500, 400, "Center"]
  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  process :resize_to_limit => [400, 350,"Center"] # 任意でリサイズの制限

  # 保存する画像の種類をサイズ別に設定
  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumb do
    process :resize_to_fit => [50, 50]
  end
  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end
  def public_id
    return "local_test_cloudinary/" + Cloudinary::Utils.random_public_id;
  end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end
  def extension_whitelist
     %w(jpg jpeg gif png)
   end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
