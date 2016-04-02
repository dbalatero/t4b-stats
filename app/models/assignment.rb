class Assignment < ActiveRecord::Base
  STATUSES = {
    "#ffffff" => "prepping", # no files yet
    "#ff9900" => "stuck", # stuck, will be fixed
    "#ffff00" => "ready_for_upload", # ready to upload to hustle
    "#00ff00" => "ready_for_hustling", # in hustlers' phones
    "#f9cb9c" => "almost_completed", # 98% of tasks are done, few stragglers
    "#ea9999" => "almost_completed",
    "#9900ff" => "completed", # 100% are done
    "#ff0000" => "canceled" # canceled for some reason (event canceled?)
  }

  validates :status, inclusion: { in: STATUSES.values.uniq }

  def row_color=(hex_color)
    if hex_color != self.row_color
      update_status_from_row_color(hex_color)
    end

    super
  end

  private

  def update_status_from_row_color(color)
    new_status = STATUSES[color]
    self.status = new_status

    case new_status
    when "ready_for_hustling"
      self.ready_for_hustling_at ||= Time.current
    when "ready_for_upload"
      self.ready_for_upload_at ||= Time.current
    when "completed"
      self.completed_at ||= Time.current
    end
  end
end
