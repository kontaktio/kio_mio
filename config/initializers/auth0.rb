Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV['AUTH0_MIO_CLIENT_ID'],
    ENV['AUTH0_MIO_CLIENT_SECRET'],
    ENV['AUTH0_MIO_DOMAIN'],
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid email profile'
    }
  )
end
