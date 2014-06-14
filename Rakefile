require "bundler/gem_tasks"

namespace 'p_g' do
  desc 'migrate the database'
  task 'migrate' do
    database_url = ENV['DATABASE_URL']
    migration_path = File.join(File.dirname(__FILE__), 'migrate')
    `sequel -m #{migration_path} #{database_url}`
  end
end