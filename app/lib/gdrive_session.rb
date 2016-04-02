class GdriveSession
  def self.instance
    @session ||= GoogleDrive.saved_session(GdriveConfig.instance)
  end
end
