Rails.application.config.middleware.use OmniAuth::Builder do

	if ENV['RAILS_ENV'] == 'production'
		HOST = 'www.modernmind.herokuapp.com'
		URL = 'http://#{HOST}/auth/facebook/callback'
	else
		HOST= 'localhost:3000'
		URL= 'http://#{HOST}/auth/facebook/callback'
	end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
  callback_url: URL
}
end