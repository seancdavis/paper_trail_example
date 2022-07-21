# Install PaperTrail

Now we're ready to install PaperTrail! Add the gem to your Gemfile.

```ruby
gem 'paper_trail'
```

Install the gem:

```text
bundle install
```

Add the versions table to your database

```text
bundle exec rails generate paper_trail:install --with-changes
bundle exec rake db:migrate
```

Then add PaperTrail to the post model:

```ruby
# app/models/post.rb

class Post < ApplicationRecord
  has_paper_trail
end
```

And set `whodunnit` as the `current_user` in your application controller:

```ruby
# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
end
```

In the next step, we'll make sure PaperTrail is working.
