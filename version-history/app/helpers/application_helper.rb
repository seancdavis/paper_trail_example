# frozen_string_literal: true

module ApplicationHelper
  def secondary_button_classes
    %w[
      bg-stone-200
      duration-300
      flex
      hover:bg-pink-500
      hover:text-white
      items-center
      no-underline
      p-2
      rounded-md
      text-inherit
      transition-colors
    ].join(' ')
  end
end
