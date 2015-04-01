set :environment, "production"

every 1.day, :at => '13 pm' do
  rake "notification:create"
end