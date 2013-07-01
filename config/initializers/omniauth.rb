OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "513539342013567", "e040ba5311c9e2afe69bc8cd128ff3b6"
end