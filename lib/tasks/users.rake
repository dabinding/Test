namespace :department_form do
  desc "Creates admin account for the Cumulus application."
  namespace :admin do
    task :create => :environment do
      require File.join(File.dirname(__FILE__), '..', '..', 'db', 'default', 'users.rb')
      puts "Done!"
    end
  end
end
