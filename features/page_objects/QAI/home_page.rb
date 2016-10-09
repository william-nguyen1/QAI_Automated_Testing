require_relative 'base_page'

module QAI
  class HomePage < QAI::BasePage

    def click_image
      $browser.find_element(:id, "displayImage").click
    end




  end
end
