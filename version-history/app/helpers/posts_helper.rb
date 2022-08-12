# frozen_string_literal: true

module PostsHelper
  def post_group(post)
    return 'Today' if post.created_at.today?
    return 'Yesterday' if post.created_at.yesterday?

    post.created_at.strftime('%B %-d, %Y')
  end
end
