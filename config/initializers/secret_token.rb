# no regular words or you'll be exposed to dictionary attacks.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_token = '3b148e5b606786c261cb80e794f0c4ea87cdbe6ef75d17070086574943a05d2d97ee5c790f0e2eb62b4aff469542b23d2408f2303adacc378683fb9a4072e15f'
