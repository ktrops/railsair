OmniAuth.config.logger = Rails.logger

options = {
  :provider_ignores_state => true,
  :name => "google",
  :scope => "email, profile",
  :prompt => "select_account",
  :image_aspect_ratio => "square",
  :image_size => 50
}

if !Rails.env.production?
  options.merge!({
    :client_options => {
      :ssl => {
        :ca_file => "/usr/lib/ssl/certs/ca-bundle.crt",
        :ca_path => "/usr/lib/ssl/certs"
      }
    }
  })
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, GOOGLE[:google_client_id], GOOGLE[:google_client_secret], options
    # {:client_options => {:ssl => {:ca_path => "/usr/lib/ssl/certs"}}}
end

