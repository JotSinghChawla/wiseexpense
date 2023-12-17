Recaptcha.configure do |config|
    config.site_key = ENV['WISEEXPENSE_RECAPTCHA_V2_KEY']
    config.secret_key = ENV['WISEEXPENSE_RECAPTCHA_V2_SECRET']
end