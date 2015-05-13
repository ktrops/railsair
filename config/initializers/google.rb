OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, GOOGLE[:google_client_id], GOOGLE[:google_client_secret], provider_ignores_state: true
end