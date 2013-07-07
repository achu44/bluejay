OmniAuth.config.logger = Rails.logger

 # Rails.application.config.middleware.use OmniAuth::Builder do
 #   provider :facebook, "513539342013567", "e040ba5311c9e2afe69bc8cd128ff3b6"
 # end
# Stack overflow says to not authenticate twice - look at answer 3: 
# http://stackoverflow.com/questions/11407216/dealing-with-oauth-2-0-facebook-gem-error-100-this-authorization-code-has-been
  # , {:provider_ignores_states => true} https://github.com/intridea/omniauth-oauth2/issues/32 for
  # auth failure.
