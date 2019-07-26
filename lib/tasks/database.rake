namespace :database do
    desc 'Init Database from Scratch'
    task init: :environment do
      # Clear Database
      Tenant.destroy_all if ActiveRecord::Base.connection.table_exists? 'tenants'
  
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:seed'].invoke
      Rails.cache.clear
      system('bundle exec annotate')
    end
  
    desc 'Database migrate back to front and seed it'
    task migrate: :environment do
      # Clear Database
      Tenant.destroy_all if ActiveRecord::Base.connection.table_exists? 'tenants'
  
      # Execute Migrations
      ENV['VERSION'] = '0'
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:migrate'].reenable
      ENV.delete 'VERSION'
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:seed'].invoke
      Rails.cache.clear
      if Rails.env.development?
        system('bundle exec annotate')
      end
    end
  
    desc 'Database migrate back to front and seed it'
    task migrate_v0: :environment do
      # Clear Database
      Tenant.destroy_all if ActiveRecord::Base.connection.table_exists? 'tenants'
      system('bundle exec rake db:migrate VERSION=0')
    end
  
    task seed_teenant: :environment do
      Rake::Task['db:seed'].invoke
      Rake::Task['db:seed'].reenable
    end
  
    desc 'Test Database restart'
    task init_test: :environment do
      system('bundle exec rake db:reset RAILS_ENV=test')
    end
  
    desc 'Destroy all Databases'
    task destroy_all: :environment do
      # Clear Database
      Tenant.destroy_all if ActiveRecord::Base.connection.table_exists? 'tenants'
      Rake::Task['db:drop'].invoke
    end
  end
  