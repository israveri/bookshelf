require "database_cleaner-sequel"

Hanami.app.prepare(:database)
DatabaseCleaner[:sequel, db: Hanami.app["database.db"]]

# We're using SQLite, so Database Cleaner understands it as a
# remote database. We need this flag set to make it work.
#
#   https://github.com/DatabaseCleaner/database_cleaner#safeguards
DatabaseCleaner.allow_remote_database_url = true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    unless Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
