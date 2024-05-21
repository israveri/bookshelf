# Bookshelf

This is the basic Hanami app used in it's [official guide][hanami] with slight modifications. The main differences are as follows:

* SQLite instead of Postgres
* Persistence dependency is set as `database` instead of `persistence` as in the guides
* Procfile manager is set to use [Overmind][overmind] instead of Foreman

------------

# Progress Tracking

### Done

* ✅ Initial setup
* ✅ Database setup
* ✅ Listing book data

### Next

* Using request parameters

[hanami]:   https://guides.hanamirb.org/v2.1/introduction/getting-started/
[overmind]: https://github.com/DarthSim/overmind
