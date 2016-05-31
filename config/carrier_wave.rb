# if Rails.env.production?
#     CarrierWave.configure do |config|
#         config.fog_credentials = {
#             :provider => 'AWS'
#             :aws_access_key_id => ENV['S3_ACCESS_KEY']
#             :aws_secret_key_key => ENV['S3_SECRET_KEY']
            
#         }
        
#         config.fog_directory = ENV['S3_BUCKET']
        
# end

if Rails.env.production?

CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :s3_access_key_id      => ENV['S3_ACCESS_KEY'],                        # required
    :s3_secret_access_key  => ENV['S3_SECRET_KEY'],                     # required
    :region                 => 'eu-west-1' 
        
        }
    
    config.fog_directory = ENV['S3_BUCKET']

    end

end
