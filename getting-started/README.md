# Getting Started with PaperTrail

This project demonstrates the basics of PaperTrail setup at the simplest level.

## Running Locally

Clone the example projects monorepo.

    git clone https://github.com/seancdavis/ultimate_paper_trail_guide.git
    cd ultimate_paper_trail_guide/getting-started

Install dependencies.

    bundle install

Setup the database and add seed data. This project uses SQLite for development.

    bundle exec rails db:setup

This creates a single user: `admin@example.com` with password `password`. You can use this user to make CRUD operations on post instances.

Run the development server. Note that you'll be able to make changes to posts, but you won't see PaperTrail versions in the UI.

    bundle exec rails server

Or work in the console, which is where you can more immediately see versions for a post.

    bundle exec rails console

## Exploring Versions

The easiest way to explore versions here is through the Rails console.

    bundle exec rails console

Create a post.

```rb
post = Post.create(title: "Hello World", body: "Lorem ipsum ...")
```

And then you can explore versioning through PaperTrail.

```rb
post.versions

# =>
# [#<PaperTrail::Version:...
#   id: ...,
#   item_type: "Post",
#   item_id: ...,
#   event: "create",
#   whodunnit: nil,
#   object: nil,
#   created_at: ...,
#   object_changes: "...">]
```
