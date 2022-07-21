# Verify PaperTrail Setup

Let's begin the check by <%= link_to "creating a new post", new_post_path %>. You'll be prompted to sign in if you've signed out since step 2.

Then open the Rails console.

```text
bundle exec rails console
```

Run this command to find the latest post:

```ruby
latest_post = Post.order(created_at: :desc).first
```

To verify PaperTrail is installed correctly, you should be able to see that it has a version stored by PaperTrail:

```ruby
latest_post.versions

# <PaperTrail::Version:...
#   id: 1,
#   item_type: "Post",
#   item_id: 107,
#   event: "create",
#   whodunnit: "...",
#   object: nil,
#   created_at: "...",
#   object_changes: # ...>
```

And let's also check that you can get to the user who made the change (the one you're signed in as):

```ruby
User.find(latest_post.versions.last.whodunnit)

# <User:...
#   id: 6,
#   name: "...",
#   created_at: "...",
#   updated_at: "...">
```
