namespace :database do
    desc 'Init Database from Scratch'
    task init: :environment do
      # Clear Database  
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:seed'].invoke
      Rails.cache.clear
      system('bundle exec annotate')
    end
end
  