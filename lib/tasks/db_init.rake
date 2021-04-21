namespace :db do 
  desc 'drop, create, migrate and seed the database -- a custom task hehehehehe'
  task init: :environment do 
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end

end