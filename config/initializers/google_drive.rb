require "google/api_client"
require "google_drive"

Rails.configuration.x.gdrive_config = GdriveConfig.new \
  client_id: ENV.fetch('GDRIVE_CLIENT_ID'),
  client_secret: ENV.fetch('GDRIVE_CLIENT_SECRET'),
  refresh_token: ENV['GDRIVE_REFRESH_TOKEN'],
  scope: %w[
    https://www.googleapis.com/auth/drive
    https://spreadsheets.google.com/feeds/
    https://www.googleapis.com/auth/spreadsheets
  ]
