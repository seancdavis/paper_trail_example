# Install PaperTrail

Now we're ready to install PaperTrail! Add the gem to your Gemfile.

```ruby
gem 'paper_trail'
```

Install the gem:

```text
> bundle install
```

Add the versions table to your database

```text
> bundle exec rails generate paper_trail:install --with-changes
> bundle exec rake db:migrate
```

Then add PaperTrail to the post model:

```ruby
# app/models/post.rb

class Post < ApplicationRecord
  has_paper_trail
  before_action :set_paper_trail_whodunnit
end
```

<div class="mt-8 text-center">
  <%= link_to "PaperTrail is installed!", set_step_path(step: 4), class: 'button', method: :post %>
</div>
