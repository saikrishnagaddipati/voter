OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1144424925596605', '9a6f98b0c4d6ac3b8aaa137e6f3f1024', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end