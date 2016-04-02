class UpdateColorCells
  def self.run
    new.run
  end

  def run
    session.request :post, endpoint_url, data: data

    true
  end

  private

  def data
    { function: "updateColors" }.to_json
  end

  def endpoint_url
    "https://script.googleapis.com/v1/scripts/#{script_key}:run"
  end

  def script_key
    ENV.fetch("COLOR_SCRIPT_KEY")
  end

  def session
    GdriveSession.instance
  end
end
