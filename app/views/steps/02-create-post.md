# Creating Posts

You can also create posts. Let's make sure it's working.

Begin by <%= link_to "signing in", new_session_path(redirect_to: request.path) %>. All you have to do is pick a user — no password is required.

After you do that, you should be redirected back here, and you should see your user's avatar in the top right corner.

To the left of the avatar is a _Create Post_ button. Click that and create a new post. This will add a post to the top of the post feed.

<div class="mt-8 text-center">
  <%= link_to "I created a post", set_step_path(step: 3), class: 'button', method: :post %>
</div>
