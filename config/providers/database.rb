Hanami.app.register_provider :database, namespace: true do
  prepare do
    require "rom"

    options = {}
    config  = ROM::Configuration.new(:sql, target["settings"].database_url, options)

    register "config", config
    register "db", config.gateways[:default].connection
  end

  start do
    config = target["database.config"]

    config.auto_registration(
      target.root.join("lib/bookshelf/database"),
      namespace: "Bookshelf::Database"
    )

    register "rom", ROM.container(config)
  end
end
