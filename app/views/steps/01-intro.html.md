# Welcome to <br> The Ultimate PaperTrail Guide!

We're starting with a basic simple mini blog application. If you've seeded the database, you should see <%= link_to 'a post feed', posts_path %>.

If not, run the following commands:

```ruby
def hello
  puts "Hello"
end
```

<div class="mt-8 text-center">
  <%= link_to "Next Step", set_step_path(step: 2), class: 'button', method: :post %>
</div>
