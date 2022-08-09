# frozen_string_literal: true

require 'coderay'
require 'redcarpet'

module MarkdownHandler
  module Handler
    def self.call(template, source)
      compiled_template = erb.call(template, source)
      "MarkdownHandler::Handler.render(begin;#{compiled_template};end)"
    end

    def self.render(source)
      markdown.render(source).html_safe
    end

    def self.markdown
      @markdown ||= Redcarpet::Markdown.new(
        MarkdownHandler::Renderer,
        {
          autolink: true,
          lax_spacing: false,
          fenced_code_blocks: true,
          space_after_headers: true,
          disable_indented_code_blocks: true
        }
      )
    end

    def self.erb
      @erb ||= ActionView::Template.registered_template_handler(:erb)
    end
  end

  class Renderer < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(css: :class)
    end
  end
end

ActionView::Template.register_template_handler(:md, MarkdownHandler::Handler)
