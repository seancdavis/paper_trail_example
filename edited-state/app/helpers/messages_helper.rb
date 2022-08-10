# frozen_string_literal: true

module MessagesHelper
  def message_group(message)
    return 'Today' if message.created_at.today?
    return 'Yesterday' if message.created_at.yesterday?

    message.created_at.strftime('%B %-d, %Y')
  end
end
