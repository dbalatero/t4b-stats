namespace :assignments do
  task :update => :environment do
    Rails.logger.info "Updating assignments..."

    UpdateAssignments.run

    Rails.logger.info "---> Done updating assignments!"
  end
end
