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
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each, type: :database) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
