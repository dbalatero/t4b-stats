class GdriveConfig
  attr_reader :client_id, :client_secret
  attr_accessor :refresh_token, :scope

  def initialize(client_id:, client_secret:, refresh_token: nil, scope: nil)
    @client_id = client_id
    @client_secret = client_secret
    @refresh_token = refresh_token
    @scope = scope
  end

  # According to docs, we need this method:
  # https://github.com/gimite/google-drive-ruby/blob/master/lib/google_drive.rb#L116
  def save
    nil
  end

  def self.instance
    Rails.configuration.x.gdrive_config
  end
end
