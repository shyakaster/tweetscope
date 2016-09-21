
#config.fog_credentials = {  } # Provider specific credentials
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                      # required
      #region:                'us-west-2' if US Standard is chosen as region no need for this code if not please specify the region otherwise it defaults to 'us-east-1'

  }
  #s3 = Aws::S3::Resource.new(region: 'us-west-2')
  config.fog_directory  = ENV['AWS_BUCKET']                          # required
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end