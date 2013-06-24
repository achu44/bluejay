OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['51353934	2013567'], ENV['e040ba5311c9e2afe69bc8cd128ff3b6']
end