# frozen_string_literal: true

module ChannelsHelper
  def channel_link_classes(channel)
    classes = %w[block px-6 py-1 no-underline duration-300 transition-colors]

    classes << if channel == @channel
                 %w[bg-pink-600 text-white]
               else
                 %w[text-stone-400 hover:bg-stone-900 hover:text-stone-300]
               end

    classes.join(' ')
  end
end
