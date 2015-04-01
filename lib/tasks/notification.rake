namespace :notification do
  desc "Create Notification"
  task create: :environment do
  	Notification.create_notification
  	p '#{Time.now} - Success'
  end

end
