class Assignment < ActiveRecord::Base
  STATUSES = %w[
    prepping
    stuck
    ready_for_upload
    ready_for_hustling
    almost_completed
    completed
  ]

  validates :status, inclusion: { in: STATUSES }
end
