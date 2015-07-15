Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.google_id, Rails.application.secrets.google_secret
  {
        :image_aspect_ratio => "square",
        :image_size => 512
  }
  
  # provider :facebook, Rails.application.secrets.facebook_id, Rails.application.secrets.facebook_secret
end