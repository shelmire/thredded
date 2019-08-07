# frozen_string_literal: true

require 'support/features/page_object/base'

module PageObject
  class MessageBoard < Base
    attr_accessor :messageboard

    def initialize(messageboard)
      @messageboard = messageboard
    end

    def listed?
      has_content? @messageboard.name
    end

    def deletable?
      within css_selector do
        has_button? "Delete"
      end
    end

    def delete
      within css_selector do
        click_button "Delete"
      end
    end

    def css_selector
      ".thredded--form-list"
    end

    def visit_messageboard_edit
      visit edit_messageboard_path(@messageboard)
    end

    def has_redirected_after_delete?
        has_content?('Messageboard deleted')
    end
  end
end
